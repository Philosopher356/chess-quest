import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../domain/entities/world.dart';
import '../../../auth/presentation/providers/profile_provider.dart';

class WorldMapScreen extends ConsumerWidget {
  const WorldMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(activeProfileProvider);
    final worlds = World.all;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Chess Quest'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: profileAsync.when(
        data: (profile) {
          final xp = profile?.totalXp ?? 0;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: worlds.length,
            itemBuilder: (context, index) {
              final world = worlds[index];
              final isUnlocked = xp >= world.requiredXpToUnlock;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _WorldCard(
                  world: world,
                  worldIndex: index,
                  isUnlocked: isUnlocked,
                  onTap: isUnlocked
                      ? () => context.go('/learn/$index')
                      : null,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _WorldCard extends StatelessWidget {
  final World world;
  final int worldIndex;
  final bool isUnlocked;
  final VoidCallback? onTap;

  const _WorldCard({
    required this.world,
    required this.worldIndex,
    required this.isUnlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isUnlocked ? 1.0 : 0.5,
        child: Card(
          elevation: isUnlocked ? 4 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  world.color.withAlpha(isUnlocked ? 40 : 15),
                  world.color.withAlpha(isUnlocked ? 15 : 5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: world.color.withAlpha(isUnlocked ? 50 : 20),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      '${worldIndex + 1}',
                      style: AppTypography.heading1.copyWith(
                        color: world.color,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(world.name, style: AppTypography.heading3),
                      const SizedBox(height: 4),
                      Text(world.subtitle, style: AppTypography.bodySmall),
                      const SizedBox(height: 4),
                      Text(
                        '${world.chapters.length} chapters',
                        style: AppTypography.caption,
                      ),
                    ],
                  ),
                ),
                if (!isUnlocked)
                  Column(
                    children: [
                      const Icon(Icons.lock, color: AppColors.textSecondary),
                      const SizedBox(height: 4),
                      Text(
                        '${world.requiredXpToUnlock} XP',
                        style: AppTypography.caption,
                      ),
                    ],
                  )
                else
                  Icon(
                    Icons.arrow_forward_ios,
                    color: world.color,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
