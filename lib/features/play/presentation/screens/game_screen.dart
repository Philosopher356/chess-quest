import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/animated_chessboard.dart';
import '../providers/game_provider.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameControllerProvider);
    final controller = ref.read(gameControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('vs ${gameState.difficulty.displayName} AI'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _showExitDialog(context, controller),
        ),
        actions: [
          if (!gameState.isGameOver)
            TextButton(
              onPressed: () => _showResignDialog(context, controller),
              child: const Text('Resign'),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Status bar
            _StatusBar(gameState: gameState),

            // Board
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: AnimatedChessboard(
                      fen: gameState.fen,
                      interactable:
                          gameState.isPlayerTurn && !gameState.isGameOver,
                      showCoordinates: true,
                      onMove: (from, to) => controller.playerMove(from, to),
                    ),
                  ),
                ),
              ),
            ),

            // Move count and thinking indicator
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (gameState.isThinking)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('AI is thinking...',
                            style: AppTypography.bodySmall),
                      ],
                    ),
                  const SizedBox(height: 8),
                  Text(
                    'Move ${gameState.moveCount}',
                    style: AppTypography.caption,
                  ),
                ],
              ),
            ),

            // Game over overlay
            if (gameState.isGameOver) _GameOverCard(gameState: gameState),
          ],
        ),
      ),
    );
  }

  void _showResignDialog(BuildContext context, GameController controller) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Resign?'),
        content: const Text('Are you sure you want to give up this game?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Keep Playing'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              controller.resign();
            },
            child: const Text('Resign'),
          ),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context, GameController controller) {
    final gameState = ProviderScope.containerOf(context)
        .read(gameControllerProvider);
    if (gameState.isGameOver) {
      context.pop();
      return;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave Game?'),
        content: const Text('Your current game will be lost.'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Stay'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.pop();
            },
            child: const Text('Leave'),
          ),
        ],
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  final GameState gameState;

  const _StatusBar({required this.gameState});

  @override
  Widget build(BuildContext context) {
    final statusText = gameState.isGameOver
        ? (gameState.resultReason ?? 'Game Over')
        : gameState.isPlayerTurn
            ? 'Your turn'
            : 'AI thinking...';

    final statusColor = gameState.isGameOver
        ? (gameState.result == 'win' ? AppColors.success : AppColors.error)
        : gameState.isPlayerTurn
            ? AppColors.primary
            : AppColors.textSecondary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: statusColor.withAlpha(20),
      child: Text(
        statusText,
        style: AppTypography.bodyLarge.copyWith(color: statusColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _GameOverCard extends StatelessWidget {
  final GameState gameState;

  const _GameOverCard({required this.gameState});

  String get _emoji {
    return switch (gameState.result) {
      'win' => '🏆',
      'loss' => '😔',
      'draw' => '🤝',
      _ => '🏁',
    };
  }

  String get _title {
    return switch (gameState.result) {
      'win' => 'You Win!',
      'loss' => 'You Lost',
      'draw' => 'Draw!',
      _ => 'Game Over',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_emoji, style: const TextStyle(fontSize: 48)),
          const SizedBox(height: 8),
          Text(_title, style: AppTypography.heading2),
          if (gameState.resultReason != null)
            Text(gameState.resultReason!, style: AppTypography.bodySmall),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Back'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Start new game by re-reading the provider
                    final container = ProviderScope.containerOf(context);
                    container.read(gameControllerProvider.notifier).newGame();
                  },
                  child: const Text('Play Again'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
