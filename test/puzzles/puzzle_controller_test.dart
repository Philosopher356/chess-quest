import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chess_quest/features/puzzles/presentation/providers/puzzle_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('PuzzleController', () {
    test('initial state has a puzzle loaded', () {
      final state = container.read(puzzleControllerProvider);
      expect(state.puzzle.fen, isNotEmpty);
      expect(state.puzzle.solution, isNotEmpty);
      expect(state.isSolved, isFalse);
      expect(state.isFailed, isFalse);
      expect(state.attempts, equals(0));
    });

    test('correct move on single-move puzzle solves it', () {
      // Find a mate-in-1 puzzle (single solution move)
      final notifier = container.read(puzzleControllerProvider.notifier);

      // Load a specific puzzle by cycling until we find a 1-move solution
      PuzzleState state;
      do {
        notifier.nextPuzzle();
        state = container.read(puzzleControllerProvider);
      } while (state.puzzle.solution.length > 1);

      // Extract expected move
      final expected = state.puzzle.solution[0];
      final from = expected.substring(0, 2);
      final to = expected.substring(2, 4);

      notifier.handleMove(from, to);
      state = container.read(puzzleControllerProvider);
      expect(state.isSolved, isTrue);
    });

    test('wrong move increments attempts', () {
      final notifier = container.read(puzzleControllerProvider.notifier);
      notifier.handleMove('a1', 'a2'); // Almost certainly wrong
      final state = container.read(puzzleControllerProvider);
      // Either it was correct (unlikely) or attempts increased
      if (!state.isSolved) {
        expect(state.attempts, greaterThan(0));
      }
    });

    test('3 wrong attempts marks puzzle as failed', () {
      final notifier = container.read(puzzleControllerProvider.notifier);
      notifier.handleMove('a1', 'h8');
      notifier.handleMove('a1', 'h7');
      notifier.handleMove('a1', 'h6');
      final state = container.read(puzzleControllerProvider);
      if (!state.isSolved) {
        expect(state.isFailed, isTrue);
        expect(state.attempts, equals(3));
      }
    });

    test('nextPuzzle loads a new puzzle', () {
      final state1 = container.read(puzzleControllerProvider);
      final firstId = state1.puzzle.id;

      // Try multiple times since it could randomly pick the same one
      var changed = false;
      for (var i = 0; i < 10; i++) {
        container.read(puzzleControllerProvider.notifier).nextPuzzle();
        final state2 = container.read(puzzleControllerProvider);
        if (state2.puzzle.id != firstId) {
          changed = true;
          break;
        }
      }
      expect(changed, isTrue);
    });

    test('nextPuzzle resets state', () {
      final notifier = container.read(puzzleControllerProvider.notifier);
      notifier.handleMove('a1', 'h8'); // wrong
      notifier.nextPuzzle();
      final state = container.read(puzzleControllerProvider);
      expect(state.attempts, equals(0));
      expect(state.isSolved, isFalse);
      expect(state.isFailed, isFalse);
      expect(state.currentMoveIndex, equals(0));
    });

    test('loadThemePuzzle loads a puzzle of the given theme', () {
      final notifier = container.read(puzzleControllerProvider.notifier);
      notifier.loadThemePuzzle('fork');
      final state = container.read(puzzleControllerProvider);
      expect(state.puzzle.theme, equals('fork'));
    });
  });
}
