import 'dart:math';

import 'package:bishop/bishop.dart' as bishop;

import '../domain/engine_interface.dart';

/// Pure Dart minimax engine for web platform.
/// Uses bishop package for move generation and alpha-beta pruning for search.
class DartMinimaxEngine implements ChessEngine {
  final _random = Random();

  static const Map<int, int> _pieceValues = {
    1: 100, // pawn
    2: 320, // knight
    3: 330, // bishop
    4: 500, // rook
    5: 900, // queen
    6: 20000, // king
  };

  @override
  Future<void> init() async {}

  @override
  Future<String> getBestMove(
    String fen, {
    int? depth,
    int? timeMs,
  }) async {
    final searchDepth = depth ?? 3;
    final game = bishop.Game(fen: fen);
    final moves = game.generateLegalMoves();

    if (moves.isEmpty) return '';
    if (moves.length == 1) {
      return _moveToAlgebraic(moves.first, game);
    }

    bishop.Move? bestMove;
    var bestScore = -999999;

    for (final move in moves) {
      game.makeMove(move);
      final score = -_alphaBeta(game, searchDepth - 1, -999999, 999999);
      game.undo();

      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }

    return _moveToAlgebraic(bestMove ?? moves.first, game);
  }

  int _alphaBeta(bishop.Game game, int depth, int alpha, int beta) {
    if (depth == 0) return _evaluate(game);

    final moves = game.generateLegalMoves();
    if (moves.isEmpty) {
      if (game.inCheck) return -99999 - depth;
      return 0; // Stalemate
    }

    var currentAlpha = alpha;
    for (final move in moves) {
      game.makeMove(move);
      final score = -_alphaBeta(game, depth - 1, -beta, -currentAlpha);
      game.undo();

      if (score >= beta) return beta;
      if (score > currentAlpha) currentAlpha = score;
    }

    return currentAlpha;
  }

  int _evaluate(bishop.Game game) {
    var score = 0;
    final board = game.board;
    final size = game.variant.boardSize;

    // Iterate over valid squares only (0x88 board)
    for (var rank = 0; rank < size.v; rank++) {
      for (var file = 0; file < size.h; file++) {
        final sq = rank * size.h * 2 + file;
        if (sq >= board.length) continue;

        final piece = board[sq];
        if (piece.isEmpty) continue;

        final pieceType = piece.type;
        final isWhitePiece = piece.colour == bishop.Bishop.white;
        final value = _pieceValues[pieceType] ?? 0;

        if (isWhitePiece) {
          score += value;
        } else {
          score -= value;
        }
      }
    }

    // Return from perspective of side to move
    return game.turn == bishop.Bishop.white ? score : -score;
  }

  String _moveToAlgebraic(bishop.Move move, bishop.Game game) {
    final size = game.variant.boardSize;
    final from = size.squareName(move.from);
    final to = size.squareName(move.to);
    return '$from$to';
  }

  /// Get a move with random chance (for easier AI levels).
  Future<String> getBestMoveWithRandomness(
    String fen, {
    required AiDifficulty difficulty,
  }) async {
    if (_random.nextDouble() < difficulty.randomMoveProbability) {
      final game = bishop.Game(fen: fen);
      final moves = game.generateLegalMoves();
      if (moves.isEmpty) return '';
      final randomMove = moves[_random.nextInt(moves.length)];
      return _moveToAlgebraic(randomMove, game);
    }
    return getBestMove(fen, depth: difficulty.depth);
  }

  @override
  Future<int> evaluate(String fen) async {
    final game = bishop.Game(fen: fen);
    return _evaluate(game);
  }

  @override
  void dispose() {}
}
