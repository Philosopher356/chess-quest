import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';

class MascotBubble extends StatelessWidget {
  final String message;
  final String emotion;

  const MascotBubble({
    super.key,
    required this.message,
    this.emotion = 'happy',
  });

  String get _mascotEmoji {
    return switch (emotion) {
      'excited' => '🤩',
      'thinking' => '🤔',
      'explaining' => '🐴',
      'encouraging' => '💪',
      'happy' => '😄',
      'surprised' => '😲',
      'proud' => '🥳',
      'worried' => '😰',
      'laughing' => '😂',
      'determined' => '😤',
      'storytelling' => '📖',
      _ => '🐴',
    };
  }

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child:
                      Text(_mascotEmoji, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Sir Hops',
                style: AppTypography.caption.copyWith(
                  fontSize: 10,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(message, style: AppTypography.mascotSpeech),
          ),
        ],
      ),
    );
  }
}
