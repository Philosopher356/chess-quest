import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';

class PuzzleHubScreen extends StatelessWidget {
  const PuzzleHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Puzzles')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Daily challenge card
            _PuzzleCard(
              icon: '🌟',
              title: 'Daily Challenge',
              subtitle: 'Solve today\'s puzzle for bonus XP!',
              color: AppColors.accent,
              onTap: () => GoRouter.of(context).go('/puzzles/train'),
            ),
            const SizedBox(height: 16),

            // Tactics trainer
            _PuzzleCard(
              icon: '🧩',
              title: 'Tactics Trainer',
              subtitle: 'Adaptive puzzles matched to your level',
              color: AppColors.primary,
              onTap: () => GoRouter.of(context).go('/puzzles/train'),
            ),
            const SizedBox(height: 16),

            // Theme practice
            Text('Practice by Theme', style: AppTypography.heading3),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: const [
                  _ThemeCard(icon: '🍴', title: 'Forks', count: 50),
                  _ThemeCard(icon: '📌', title: 'Pins', count: 40),
                  _ThemeCard(icon: '⚡', title: 'Skewers', count: 30),
                  _ThemeCard(icon: '🎭', title: 'Discovered\nAttacks', count: 25),
                  _ThemeCard(icon: '🏆', title: 'Mate in 1', count: 100),
                  _ThemeCard(icon: '🏆', title: 'Mate in 2', count: 75),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PuzzleCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _PuzzleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withAlpha(30), color.withAlpha(10)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 36)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.heading3),
                    const SizedBox(height: 4),
                    Text(subtitle, style: AppTypography.bodySmall),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final String icon;
  final String title;
  final int count;

  const _ThemeCard({
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(title,
                style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center),
            Text('$count puzzles', style: AppTypography.caption),
          ],
        ),
      ),
    );
  }
}
