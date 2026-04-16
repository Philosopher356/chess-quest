import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../providers/profile_provider.dart';

class ProfileSelectionScreen extends ConsumerWidget {
  const ProfileSelectionScreen({super.key});

  static const _avatars = ['🦁', '🐱', '🐶', '🦊', '🐼', '🐸', '🦄', '🐲'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesAsync = ref.watch(allProfilesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text('ChessQuest', style: AppTypography.heading1.copyWith(
                color: AppColors.primary,
                fontSize: 36,
              )),
              const SizedBox(height: 8),
              Text('Who is playing today?', style: AppTypography.bodyLarge),
              const SizedBox(height: 40),
              Expanded(
                child: profilesAsync.when(
                  data: (profiles) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: profiles.length + (profiles.length < 4 ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == profiles.length) {
                        return _AddProfileCard(
                          onTap: () => context.go('/profiles/create'),
                        );
                      }
                      final profile = profiles[index];
                      return _ProfileCard(
                        name: profile.name,
                        avatar: _avatars[profile.avatarId % _avatars.length],
                        xp: profile.totalXp,
                        onTap: () async {
                          await ref
                              .read(profileNotifierProvider.notifier)
                              .setActiveProfile(profile.id);
                          if (context.mounted) context.go('/learn');
                        },
                      );
                    },
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final String avatar;
  final int xp;
  final VoidCallback onTap;

  const _ProfileCard({
    required this.name,
    required this.avatar,
    required this.xp,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(avatar, style: const TextStyle(fontSize: 40)),
                ),
              ),
              const SizedBox(height: 12),
              Text(name, style: AppTypography.heading3),
              const SizedBox(height: 4),
              Text('$xp XP', style: AppTypography.caption.copyWith(
                color: AppColors.xpGold,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddProfileCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddProfileCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.primary.withAlpha(100),
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text('New Player', style: AppTypography.heading3.copyWith(
              color: AppColors.primary,
            )),
          ],
        ),
      ),
    );
  }
}
