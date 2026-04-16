import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/bundled_puzzles.dart';
import '../../domain/entities/puzzle.dart';

class PuzzleState {
  final ChessPuzzle puzzle;
  final int currentMoveIndex;
  final bool isSolved;
  final bool isFailed;
  final int attempts;
  final String? feedbackMessage;
  final String? lastOpponentMove;

  const PuzzleState({
    required this.puzzle,
    this.currentMoveIndex = 0,
    this.isSolved = false,
    this.isFailed = false,
    this.attempts = 0,
    this.feedbackMessage,
    this.lastOpponentMove,
  });

  String get currentExpectedMove => puzzle.solution[currentMoveIndex];
  bool get isPlayerTurn => currentMoveIndex % 2 == 0;

  PuzzleState copyWith({
    int? currentMoveIndex,
    bool? isSolved,
    bool? isFailed,
    int? attempts,
    String? feedbackMessage,
    String? lastOpponentMove,
  }) {
    return PuzzleState(
      puzzle: puzzle,
      currentMoveIndex: currentMoveIndex ?? this.currentMoveIndex,
      isSolved: isSolved ?? this.isSolved,
      isFailed: isFailed ?? this.isFailed,
      attempts: attempts ?? this.attempts,
      feedbackMessage: feedbackMessage,
      lastOpponentMove: lastOpponentMove ?? this.lastOpponentMove,
    );
  }
}

class PuzzleController extends Notifier<PuzzleState> {
  final _random = Random();

  @override
  PuzzleState build() {
    return PuzzleState(puzzle: _getRandomPuzzle());
  }

  ChessPuzzle _getRandomPuzzle() {
    final puzzles = BundledPuzzles.all;
    return puzzles[_random.nextInt(puzzles.length)];
  }

  /// Player attempts a move.
  void handleMove(String from, String to) {
    if (state.isSolved || state.isFailed) return;

    final moveStr = '$from$to';
    final expected = state.currentExpectedMove;

    if (moveStr == expected) {
      // Correct move
      final nextIndex = state.currentMoveIndex + 1;

      if (nextIndex >= state.puzzle.solution.length) {
        // Puzzle solved!
        state = state.copyWith(
          currentMoveIndex: nextIndex,
          isSolved: true,
          feedbackMessage: 'Puzzle solved!',
        );
      } else {
        // There's an opponent reply - auto-play it
        final opponentMove = state.puzzle.solution[nextIndex];
        final afterOpponent = nextIndex + 1;

        if (afterOpponent >= state.puzzle.solution.length) {
          // The opponent's move was the last one (unusual, but handle it)
          state = state.copyWith(
            currentMoveIndex: afterOpponent,
            isSolved: true,
            lastOpponentMove: opponentMove,
            feedbackMessage: 'Puzzle solved!',
          );
        } else {
          state = state.copyWith(
            currentMoveIndex: afterOpponent,
            lastOpponentMove: opponentMove,
            feedbackMessage: 'Correct! Find the next move...',
          );
        }
      }
    } else {
      // Wrong move
      final newAttempts = state.attempts + 1;
      if (newAttempts >= 3) {
        state = state.copyWith(
          isFailed: true,
          attempts: newAttempts,
          feedbackMessage: 'The solution was: ${state.currentExpectedMove}',
        );
      } else {
        state = state.copyWith(
          attempts: newAttempts,
          feedbackMessage: 'Not quite! Try again. (${3 - newAttempts} attempts left)',
        );
      }
    }
  }

  void nextPuzzle() {
    state = PuzzleState(puzzle: _getRandomPuzzle());
  }

  void loadThemePuzzle(String theme) {
    final puzzles = BundledPuzzles.byTheme(theme);
    if (puzzles.isEmpty) {
      state = PuzzleState(puzzle: _getRandomPuzzle());
      return;
    }
    state = PuzzleState(puzzle: puzzles[_random.nextInt(puzzles.length)]);
  }
}

final puzzleControllerProvider =
    NotifierProvider<PuzzleController, PuzzleState>(PuzzleController.new);
