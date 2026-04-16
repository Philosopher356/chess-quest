import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../auth/presentation/providers/profile_provider.dart';
import '../../../gamification/domain/entities/rank.dart';

class ParentDashboardScreen extends ConsumerWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(activeProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Parent Dashboard')),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('No active profile'));
          }

          final rank = Rank.fromXp(profile.totalXp);
          final progress = rank.progressToNext(profile.totalXp);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Child summary card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: rank.color.withAlpha(40),
                          child: Text(
                            rank.icon,
                            style: const TextStyle(fontSize: 28),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profile.name,
                                  style: AppTypography.heading2),
                              Text('Age ${profile.age}',
                                  style: AppTypography.bodySmall),
                              Text(rank.displayName,
                                  style: AppTypography.bodySmall
                                      .copyWith(color: rank.color)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Progress overview
                Text('Progress Overview', style: AppTypography.heading3),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _StatTile(
                      label: 'Total XP',
                      value: '${profile.totalXp}',
                      icon: Icons.star,
                      color: AppColors.xpGold,
                    ),
                    const SizedBox(width: 12),
                    _StatTile(
                      label: 'Coins',
                      value: '${profile.coinBalance}',
                      icon: Icons.monetization_on,
                      color: AppColors.coinGold,
                    ),
                    const SizedBox(width: 12),
                    _StatTile(
                      label: 'Streak',
                      value: '${profile.streakCount} days',
                      icon: Icons.local_fire_department,
                      color: AppColors.streakFlame,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Rank progress bar
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rank Progress', style: AppTypography.bodyLarge),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 10,
                            backgroundColor: AppColors.surfaceVariant,
                            valueColor: AlwaysStoppedAnimation(rank.color),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(rank.displayName,
                                style: AppTypography.caption),
                            if (rank.nextRank != null)
                              Text(
                                  'Next: ${rank.nextRank!.displayName} (${rank.nextRank!.minXp} XP)',
                                  style: AppTypography.caption),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Puzzle rating
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.extension,
                            color: AppColors.primary, size: 32),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Puzzle Rating',
                                style: AppTypography.bodyLarge),
                            Text('${profile.puzzleRating}',
                                style: AppTypography.heading2
                                    .copyWith(color: AppColors.primary)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Skills summary
                Text('Skills', style: AppTypography.heading3),
                const SizedBox(height: 12),
                _SkillBar(label: 'Board Knowledge', value: 1.0),
                _SkillBar(label: 'Piece Movement', value: 0.9),
                _SkillBar(
                  label: 'Tactics',
                  value: profile.totalXp > 2000 ? 0.7 : 0.3,
                ),
                _SkillBar(
                  label: 'Strategy',
                  value: profile.totalXp > 4000 ? 0.5 : 0.1,
                ),
                _SkillBar(
                  label: 'Endgames',
                  value: profile.totalXp > 6000 ? 0.4 : 0.1,
                ),

                const SizedBox(height: 24),

                // Tips for parents
                Card(
                  color: AppColors.info.withAlpha(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.lightbulb,
                                color: AppColors.info),
                            const SizedBox(width: 8),
                            Text('Tips for Parents',
                                style: AppTypography.bodyLarge
                                    .copyWith(color: AppColors.info)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- Encourage daily practice (even 10 minutes helps!)\n'
                          '- Play chess with your child to reinforce learning\n'
                          '- Celebrate milestones and achievements together\n'
                          '- Focus on fun, not winning - enjoyment leads to improvement',
                          style: AppTypography.bodySmall,
                        ),
                      ],
                    ),
                  ),
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

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(value,
                  style:
                      AppTypography.bodyLarge.copyWith(color: color)),
              Text(label, style: AppTypography.caption),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String label;
  final double value;

  const _SkillBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: AppTypography.bodySmall),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 8,
                backgroundColor: AppColors.surfaceVariant,
                valueColor:
                    const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text('${(value * 100).round()}%', style: AppTypography.caption),
        ],
      ),
    );
  }
}
