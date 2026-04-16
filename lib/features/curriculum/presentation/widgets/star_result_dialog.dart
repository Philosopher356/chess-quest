import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/sound_manager.dart';

class StarResultDialog extends StatefulWidget {
  final int stars;
  final int xpEarned;
  final VoidCallback onContinue;
  final bool isLastLesson;

  const StarResultDialog({
    super.key,
    required this.stars,
    required this.xpEarned,
    required this.onContinue,
    this.isLastLesson = false,
  });

  @override
  State<StarResultDialog> createState() => _StarResultDialogState();
}

class _StarResultDialogState extends State<StarResultDialog>
    with TickerProviderStateMixin {
  late List<AnimationController> _starControllers;
  late List<Animation<double>> _starAnimations;

  @override
  void initState() {
    super.initState();
    _starControllers = List.generate(
      3,
      (i) => AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
    );
    _starAnimations = _starControllers
        .map((c) => CurvedAnimation(parent: c, curve: Curves.elasticOut))
        .toList();

    // Stagger star animations with sound
    for (var i = 0; i < widget.stars; i++) {
      Future.delayed(Duration(milliseconds: 300 + i * 300), () {
        if (mounted) {
          _starControllers[i].forward();
          SoundManager().playStar();
        }
      });
    }
  }

  @override
  void dispose() {
    for (final c in _starControllers) {
      c.dispose();
    }
    super.dispose();
  }

  String get _resultMessage {
    return switch (widget.stars) {
      3 => 'Perfect!',
      2 => 'Great job!',
      1 => 'Good effort!',
      _ => 'Keep trying!',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _resultMessage,
                  style: AppTypography.heading1.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),

                // Stars
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (i) {
                    return ScaleTransition(
                      scale: i < widget.stars
                          ? _starAnimations[i]
                          : const AlwaysStoppedAnimation(1.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          Icons.star_rounded,
                          size: 56,
                          color: i < widget.stars
                              ? AppColors.starFilled
                              : AppColors.starEmpty,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),

                // XP earned
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.xpGold.withAlpha(30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('⭐', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 8),
                      Text(
                        '+${widget.xpEarned} XP',
                        style: AppTypography.heading3.copyWith(
                          color: AppColors.xpGold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.onContinue,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      widget.isLastLesson ? 'Complete Chapter!' : 'Next Lesson',
                      style: AppTypography.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
