import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../providers/profile_provider.dart';

class CreateProfileScreen extends ConsumerStatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  ConsumerState<CreateProfileScreen> createState() =>
      _CreateProfileScreenState();
}

class _CreateProfileScreenState extends ConsumerState<CreateProfileScreen> {
  final _nameController = TextEditingController();
  int _selectedAvatar = 0;
  int _selectedAge = 5;

  static const _avatars = ['🦁', '🐱', '🐶', '🦊', '🐼', '🐸', '🦄', '🐲'];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _createProfile() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    await ref.read(profileNotifierProvider.notifier).createProfile(
          name: name,
          avatarId: _selectedAvatar,
          age: _selectedAge,
        );

    if (mounted) context.go('/learn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Create Player'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/profiles'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text('Choose your avatar!',
                  style: AppTypography.heading2, textAlign: TextAlign.center),
              const SizedBox(height: 20),

              // Avatar picker
              SizedBox(
                height: 100,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _avatars.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final isSelected = index == _selectedAvatar;
                      return GestureDetector(
                        onTap: () =>
                            setState(() => _selectedAvatar = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryLight.withAlpha(80)
                                : AppColors.surfaceVariant,
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(
                                    color: AppColors.primary, width: 3)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              _avatars[index],
                              style: const TextStyle(fontSize: 36),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Name field
              Text("What's your name?", style: AppTypography.heading3),
              const SizedBox(height: 12),
              TextField(
                controller: _nameController,
                style: AppTypography.bodyLarge,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),

              const SizedBox(height: 32),

              // Age picker
              Text('How old are you?', style: AppTypography.heading3),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(14, (index) {
                  final age = index + 5;
                  final isSelected = age == _selectedAge;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedAge = age),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withAlpha(80),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          '$age',
                          style: AppTypography.bodyLarge.copyWith(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 40),

              // Create button
              ElevatedButton(
                onPressed: _createProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text("Let's Go!", style: AppTypography.button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
