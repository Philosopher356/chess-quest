import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../auth/presentation/providers/profile_provider.dart';
import '../../domain/entities/rank.dart';

class ProfileHubScreen extends ConsumerWidget {
  const ProfileHubScreen({super.key});

  static const _avatars = ['🦁', '🐱', '🐶', '🦊', '🐼', '🐸', '🦄', '🐲'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(activeProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Profile')),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('No profile selected'));
          }

          final rank = Rank.fromXp(profile.totalXp);
          final nextRank = rank.nextRank;
          final progress = rank.progressToNext(profile.totalXp);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Profile card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: rank.color.withAlpha(40),
                            shape: BoxShape.circle,
                            border: Border.all(color: rank.color, width: 3),
                          ),
                          child: Center(
                            child: Text(
                              _avatars[profile.avatarId % _avatars.length],
                              style: const TextStyle(fontSize: 48),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(profile.name, style: AppTypography.heading2),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: rank.color.withAlpha(30),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${rank.icon} ${rank.displayName}',
                            style: AppTypography.bodySmall.copyWith(
                              color: rank.color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // XP progress
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('XP Progress', style: AppTypography.bodyLarge),
                            Text(
                              '${profile.totalXp} XP',
                              style: AppTypography.bodyLarge.copyWith(
                                color: AppColors.xpGold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 12,
                            backgroundColor: AppColors.surfaceVariant,
                            valueColor: AlwaysStoppedAnimation(rank.color),
                          ),
                        ),
                        if (nextRank != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Next: ${nextRank.displayName} (${nextRank.minXp} XP)',
                            style: AppTypography.caption,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Stats grid
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: '🔥',
                        value: '${profile.streakCount}',
                        label: 'Day Streak',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: '🪙',
                        value: '${profile.coinBalance}',
                        label: 'Coins',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: '🧩',
                        value: '${profile.puzzleRating}',
                        label: 'Puzzle Rating',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Quick links
                _MenuTile(
                  icon: Icons.emoji_events,
                  title: 'Achievements',
                  color: AppColors.accent,
                  onTap: () {
                    // TODO: Navigate to achievements
                  },
                ),
                const SizedBox(height: 8),
                _MenuTile(
                  icon: Icons.shopping_bag,
                  title: 'Shop',
                  color: AppColors.coinGold,
                  onTap: () {
                    // TODO: Navigate to shop
                  },
                ),
                const SizedBox(height: 8),
                _MenuTile(
                  icon: Icons.supervisor_account,
                  title: 'Parent Dashboard',
                  color: AppColors.info,
                  onTap: () {
                    // TODO: Navigate to parent dashboard
                  },
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(value,
                style: AppTypography.heading3
                    .copyWith(color: AppColors.primary)),
            Text(label, style: AppTypography.caption),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 16),
              Text(title, style: AppTypography.bodyLarge),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
