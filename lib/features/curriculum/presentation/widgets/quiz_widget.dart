import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';

class QuizWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final void Function(int index) onAnswer;
  final int? correctIndex; // Non-null when the correct answer has been revealed

  const QuizWidget({
    super.key,
    required this.question,
    required this.options,
    required this.onAnswer,
    this.correctIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(question, style: AppTypography.bodyLarge),
          const SizedBox(height: 12),
          ...List.generate(options.length, (index) {
            final isCorrectRevealed = correctIndex == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: isCorrectRevealed
                    ? AppColors.success.withAlpha(30)
                    : AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: correctIndex == null ? () => onAnswer(index) : null,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: isCorrectRevealed
                          ? Border.all(color: AppColors.success, width: 2)
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: isCorrectRevealed
                                ? AppColors.success
                                : AppColors.primary.withAlpha(30),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              String.fromCharCode(65 + index), // A, B, C, D
                              style: AppTypography.bodySmall.copyWith(
                                color: isCorrectRevealed
                                    ? Colors.white
                                    : AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(options[index], style: AppTypography.body),
                        ),
                        if (isCorrectRevealed)
                          const Icon(Icons.check_circle,
                              color: AppColors.success, size: 22),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
