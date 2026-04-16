/// Abstract chess engine interface for cross-platform AI.
///
/// Mobile uses Stockfish via FFI, web uses a pure Dart minimax engine.
abstract class ChessEngine {
  Future<void> init();

  /// Returns the best move in algebraic notation (e.g. 'e2e4').
  Future<String> getBestMove(
    String fen, {
    int? depth,
    int? timeMs,
  });

  /// Returns a centipawn evaluation of the position.
  /// Positive = white advantage, negative = black advantage.
  Future<int> evaluate(String fen);

  void dispose();
}

/// AI difficulty levels for kid-friendly play.
enum AiDifficulty {
  pawn(1, 'Pawn', 0.30, 'Easiest - makes lots of mistakes'),
  knight(2, 'Knight', 0.15, 'Easy - sometimes makes mistakes'),
  bishop(3, 'Bishop', 0.05, 'Medium - rarely makes mistakes'),
  rook(4, 'Rook', 0.0, 'Hard - plays well'),
  queen(5, 'Queen', 0.0, 'Very Hard - plays great'),
  king(6, 'King', 0.0, 'Expert - the ultimate challenge');

  const AiDifficulty(
    this.depth,
    this.displayName,
    this.randomMoveProbability,
    this.description,
  );

  final int depth;
  final String displayName;
  final double randomMoveProbability;
  final String description;
}
