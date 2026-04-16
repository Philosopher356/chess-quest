import 'package:bishop/bishop.dart' as bishop;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/engine_provider.dart';
import '../../../engine/domain/engine_interface.dart';
import '../../../engine/data/dart_minimax_engine.dart';

class GameState {
  final String fen;
  final bool isPlayerWhite;
  final bool isPlayerTurn;
  final bool isThinking;
  final bool isGameOver;
  final String? result; // 'win', 'loss', 'draw'
  final String? resultReason;
  final AiDifficulty difficulty;
  final List<String> moveHistory;
  final int moveCount;

  const GameState({
    required this.fen,
    this.isPlayerWhite = true,
    this.isPlayerTurn = true,
    this.isThinking = false,
    this.isGameOver = false,
    this.result,
    this.resultReason,
    required this.difficulty,
    this.moveHistory = const [],
    this.moveCount = 0,
  });

  GameState copyWith({
    String? fen,
    bool? isPlayerTurn,
    bool? isThinking,
    bool? isGameOver,
    String? result,
    String? resultReason,
    List<String>? moveHistory,
    int? moveCount,
  }) {
    return GameState(
      fen: fen ?? this.fen,
      isPlayerWhite: isPlayerWhite,
      isPlayerTurn: isPlayerTurn ?? this.isPlayerTurn,
      isThinking: isThinking ?? this.isThinking,
      isGameOver: isGameOver ?? this.isGameOver,
      result: result ?? this.result,
      resultReason: resultReason ?? this.resultReason,
      difficulty: difficulty,
      moveHistory: moveHistory ?? this.moveHistory,
      moveCount: moveCount ?? this.moveCount,
    );
  }
}

/// Provider to hold selected difficulty for the current game.
class SelectedDifficultyNotifier extends Notifier<AiDifficulty> {
  @override
  AiDifficulty build() => AiDifficulty.pawn;

  void select(AiDifficulty difficulty) => state = difficulty;
}

final selectedDifficultyProvider =
    NotifierProvider<SelectedDifficultyNotifier, AiDifficulty>(
        SelectedDifficultyNotifier.new);

/// Manages a chess game against the AI.
class GameController extends Notifier<GameState> {
  late bishop.Game _game;

  static const _startFen =
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  @override
  GameState build() {
    final difficulty = ref.watch(selectedDifficultyProvider);
    _game = bishop.Game(fen: _startFen);
    return GameState(fen: _startFen, difficulty: difficulty);
  }

  void newGame() {
    _game = bishop.Game(fen: _startFen);
    final difficulty = ref.read(selectedDifficultyProvider);
    state = GameState(fen: _startFen, difficulty: difficulty);
  }

  /// Player makes a move.
  Future<void> playerMove(String from, String to) async {
    if (!state.isPlayerTurn || state.isGameOver) return;

    final moveStr = '$from$to';
    final success = _game.makeMoveString(moveStr);
    if (!success) return;

    final newFen = _game.fen;
    final history = [...state.moveHistory, moveStr];

    // Check if game is over after player move
    if (_game.gameOver) {
      state = state.copyWith(
        fen: newFen,
        isPlayerTurn: false,
        isGameOver: true,
        result: _game.won ? 'win' : 'draw',
        resultReason: _game.inCheck ? 'Checkmate!' : 'Stalemate',
        moveHistory: history,
        moveCount: state.moveCount + 1,
      );
      return;
    }

    state = state.copyWith(
      fen: newFen,
      isPlayerTurn: false,
      isThinking: true,
      moveHistory: history,
      moveCount: state.moveCount + 1,
    );

    // AI responds
    await _makeAiMove();
  }

  Future<void> _makeAiMove() async {
    final engine = ref.read(engineProvider);
    String aiMoveStr;

    if (engine is DartMinimaxEngine) {
      aiMoveStr = await engine.getBestMoveWithRandomness(
        _game.fen,
        difficulty: state.difficulty,
      );
    } else {
      aiMoveStr = await engine.getBestMove(
        _game.fen,
        depth: state.difficulty.depth,
      );
    }

    if (aiMoveStr.isEmpty || state.isGameOver) {
      state = state.copyWith(isThinking: false);
      return;
    }

    _game.makeMoveString(aiMoveStr);
    final newFen = _game.fen;
    final history = [...state.moveHistory, aiMoveStr];

    if (_game.gameOver) {
      state = state.copyWith(
        fen: newFen,
        isPlayerTurn: true,
        isThinking: false,
        isGameOver: true,
        result: _game.won ? 'loss' : 'draw',
        resultReason: _game.inCheck ? 'Checkmate!' : 'Stalemate',
        moveHistory: history,
        moveCount: state.moveCount + 1,
      );
      return;
    }

    state = state.copyWith(
      fen: newFen,
      isPlayerTurn: true,
      isThinking: false,
      moveHistory: history,
      moveCount: state.moveCount + 1,
    );
  }

  void resign() {
    state = state.copyWith(
      isGameOver: true,
      result: 'loss',
      resultReason: 'Resigned',
    );
  }
}

final gameControllerProvider =
    NotifierProvider<GameController, GameState>(GameController.new);
