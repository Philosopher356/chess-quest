import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../engine/domain/engine_interface.dart';
import '../providers/game_provider.dart';

class PlayHubScreen extends ConsumerWidget {
  const PlayHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Play')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Choose Your Opponent', style: AppTypography.heading2),
            const SizedBox(height: 8),
            Text(
              'Select a difficulty level to play against the computer',
              style: AppTypography.bodySmall,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: AiDifficulty.values.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final difficulty = AiDifficulty.values[index];
                  return _DifficultyCard(
                    difficulty: difficulty,
                    onTap: () {
                      ref.read(selectedDifficultyProvider.notifier).select(difficulty);
                      context.go('/play/game');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DifficultyCard extends StatelessWidget {
  final AiDifficulty difficulty;
  final VoidCallback onTap;

  const _DifficultyCard({
    required this.difficulty,
    required this.onTap,
  });

  String get _icon {
    return switch (difficulty) {
      AiDifficulty.pawn => '♟',
      AiDifficulty.knight => '♞',
      AiDifficulty.bishop => '♝',
      AiDifficulty.rook => '♜',
      AiDifficulty.queen => '♛',
      AiDifficulty.king => '♚',
    };
  }

  Color get _color {
    return switch (difficulty) {
      AiDifficulty.pawn => AppColors.success,
      AiDifficulty.knight => AppColors.world2,
      AiDifficulty.bishop => AppColors.world3,
      AiDifficulty.rook => AppColors.warning,
      AiDifficulty.queen => AppColors.secondary,
      AiDifficulty.king => AppColors.world5,
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _color.withAlpha(30),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(_icon, style: const TextStyle(fontSize: 32)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(difficulty.displayName,
                        style: AppTypography.bodyLarge),
                    const SizedBox(height: 2),
                    Text(difficulty.description,
                        style: AppTypography.bodySmall),
                  ],
                ),
              ),
              Icon(Icons.play_circle_fill, color: _color, size: 36),
            ],
          ),
        ),
      ),
    );
  }
}
