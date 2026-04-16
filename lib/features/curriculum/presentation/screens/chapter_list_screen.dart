import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../data/lesson_content/content_registry.dart';
import '../../domain/entities/world.dart';

class ChapterListScreen extends ConsumerWidget {
  final int worldIndex;

  const ChapterListScreen({super.key, required this.worldIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worlds = World.all;
    if (worldIndex >= worlds.length) {
      return const Scaffold(body: Center(child: Text('World not found')));
    }

    final world = worlds[worldIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(world.name)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: world.chapters.length,
        itemBuilder: (context, index) {
          final chapter = world.chapters[index];
          final hasContent = ContentRegistry.hasContent(chapter.id);
          // First chapter always unlocked; others require previous chapter done
          // For now, unlock all chapters that have content
          final isUnlocked = hasContent || index == 0;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: isUnlocked
                  ? () => context.go('/learn/$worldIndex/${chapter.id}')
                  : null,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isUnlocked ? 1.0 : 0.5,
                child: Card(
                  elevation: isUnlocked ? 3 : 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: world.color.withAlpha(30),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              chapter.icon,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(chapter.title,
                                  style: AppTypography.bodyLarge),
                              const SizedBox(height: 2),
                              Text(chapter.description,
                                  style: AppTypography.bodySmall),
                              const SizedBox(height: 4),
                              Text(
                                '${ContentRegistry.getLessons(chapter.id).length} lessons  |  ${chapter.xpReward} XP',
                                style: AppTypography.caption,
                              ),
                            ],
                          ),
                        ),
                        if (!isUnlocked)
                          const Icon(Icons.lock_outline,
                              color: AppColors.textSecondary, size: 20)
                        else
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              3,
                              (i) => Icon(
                                Icons.star_rounded,
                                size: 18,
                                color: AppColors.starEmpty,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
