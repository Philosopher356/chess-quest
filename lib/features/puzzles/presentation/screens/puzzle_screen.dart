import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/animated_chessboard.dart';
import '../providers/puzzle_provider.dart';

class PuzzleScreen extends ConsumerWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puzzleState = ref.watch(puzzleControllerProvider);
    final controller = ref.read(puzzleControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Tactics Trainer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.skip_next),
            tooltip: 'Skip puzzle',
            onPressed: controller.nextPuzzle,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Puzzle info bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: AppColors.primaryLight.withAlpha(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating: ${puzzleState.puzzle.rating}',
                    style: AppTypography.caption,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(20),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      puzzleState.puzzle.theme.replaceAll('_', ' ').toUpperCase(),
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Board
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: AnimatedChessboard(
                      fen: puzzleState.puzzle.fen,
                      interactable:
                          !puzzleState.isSolved && !puzzleState.isFailed,
                      showCoordinates: true,
                      onMove: controller.handleMove,
                    ),
                  ),
                ),
              ),
            ),

            // Feedback area
            if (puzzleState.feedbackMessage != null)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: puzzleState.isSolved
                      ? AppColors.success.withAlpha(20)
                      : puzzleState.isFailed
                          ? AppColors.error.withAlpha(20)
                          : AppColors.warning.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      puzzleState.isSolved
                          ? Icons.check_circle
                          : puzzleState.isFailed
                              ? Icons.cancel
                              : Icons.info,
                      color: puzzleState.isSolved
                          ? AppColors.success
                          : puzzleState.isFailed
                              ? AppColors.error
                              : AppColors.warning,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        puzzleState.feedbackMessage!,
                        style: AppTypography.body,
                      ),
                    ),
                  ],
                ),
              ),

            // Description
            if (puzzleState.puzzle.description != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  puzzleState.isSolved || puzzleState.isFailed
                      ? puzzleState.puzzle.description!
                      : 'Find the best move!',
                  style: AppTypography.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),

            // Action buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: puzzleState.isSolved || puzzleState.isFailed
                  ? SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: controller.nextPuzzle,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next Puzzle'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Text(
                          'Attempts: ${puzzleState.attempts}/3',
                          style: AppTypography.caption,
                        ),
                        const Spacer(),
                        Text(
                          puzzleState.isPlayerTurn
                              ? 'Your move'
                              : 'Opponent moved',
                          style: AppTypography.bodySmall.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
