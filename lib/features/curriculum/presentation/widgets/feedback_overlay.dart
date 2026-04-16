import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/sound_manager.dart';

class FeedbackOverlay extends StatefulWidget {
  final String message;
  final String type; // 'success', 'error', 'hint', 'info'
  final VoidCallback onDismiss;

  const FeedbackOverlay({
    super.key,
    required this.message,
    required this.type,
    required this.onDismiss,
  });

  @override
  State<FeedbackOverlay> createState() => _FeedbackOverlayState();
}

class _FeedbackOverlayState extends State<FeedbackOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _controller.forward();

    // Play sound based on feedback type
    if (widget.type == 'success') {
      SoundManager().playSuccess();
    } else if (widget.type == 'error') {
      SoundManager().playError();
    }

    // Auto-dismiss after a delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _backgroundColor {
    return switch (widget.type) {
      'success' => AppColors.success,
      'error' => AppColors.error,
      'hint' => AppColors.info,
      _ => AppColors.primary,
    };
  }

  IconData get _icon {
    return switch (widget.type) {
      'success' => Icons.check_circle,
      'error' => Icons.cancel,
      'hint' => Icons.lightbulb,
      _ => Icons.info,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 24,
      right: 24,
      child: GestureDetector(
        onTap: widget.onDismiss,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(16),
            color: _backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  Icon(_icon, color: Colors.white, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: AppTypography.bodyLarge
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
