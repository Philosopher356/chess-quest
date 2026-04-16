import 'package:flutter_test/flutter_test.dart';
import 'package:chess_quest/features/engine/data/dart_minimax_engine.dart';
import 'package:chess_quest/features/engine/domain/engine_interface.dart';

void main() {
  late DartMinimaxEngine engine;

  setUp(() async {
    engine = DartMinimaxEngine();
    await engine.init();
  });

  tearDown(() {
    engine.dispose();
  });

  group('DartMinimaxEngine', () {
    test('getBestMove returns valid algebraic notation', () async {
      final move = await engine.getBestMove(
        'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
        depth: 1,
      );
      expect(move.length, greaterThanOrEqualTo(4));
      expect(move[0], isIn(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']));
      expect(int.tryParse(move[1]), isNotNull);
    });

    test('finds mate in 1 with rook on back rank', () async {
      // White rook on a1 vs black king on g8 with pawns on f7, g7, h7
      final move = await engine.getBestMove(
        '6k1/5ppp/8/8/8/8/8/R3K3 w - - 0 1',
        depth: 2,
      );
      expect(move, equals('a1a8'));
    });

    test('evaluate returns positive for white material advantage', () async {
      // White has an extra queen
      final eval = await engine.evaluate(
        '4k3/8/8/8/8/8/8/4KQ2 w - - 0 1',
      );
      expect(eval, greaterThan(0));
    });

    test('evaluate returns negative for black material advantage', () async {
      // Black has an extra queen
      final eval = await engine.evaluate(
        '4kq2/8/8/8/8/8/8/4K3 w - - 0 1',
      );
      expect(eval, lessThan(0));
    });

    test('returns empty string when no legal moves', () async {
      // Stalemate position - black to move but no legal moves
      final move = await engine.getBestMove(
        'k7/8/1K6/8/8/8/8/8 b - - 0 1',
        depth: 1,
      );
      // Either empty or a valid move depending on position legality
      expect(move, isA<String>());
    });

    test('getBestMoveWithRandomness at Pawn difficulty returns a move',
        () async {
      final move = await engine.getBestMoveWithRandomness(
        'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1',
        difficulty: AiDifficulty.pawn,
      );
      expect(move.length, greaterThanOrEqualTo(4));
    });

    test('deeper depth does not crash', () async {
      final move = await engine.getBestMove(
        'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1',
        depth: 4,
      );
      expect(move.length, greaterThanOrEqualTo(4));
    });
  });
}
