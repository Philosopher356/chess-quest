import 'package:flutter/material.dart';

/// Kid-friendly color palette with high contrast and vibrant tones.
class AppColors {
  AppColors._();

  // Primary brand colors
  static const Color primary = Color(0xFF6C63FF); // Playful purple
  static const Color primaryLight = Color(0xFF9D97FF);
  static const Color primaryDark = Color(0xFF4A42D4);

  // Secondary / accent
  static const Color secondary = Color(0xFFFF6B6B); // Warm coral
  static const Color secondaryLight = Color(0xFFFF9E9E);
  static const Color accent = Color(0xFFFFD93D); // Sunny yellow

  // Background
  static const Color background = Color(0xFFF8F6FF);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF0EEFF);

  // Text
  static const Color textPrimary = Color(0xFF2D2B55);
  static const Color textSecondary = Color(0xFF6E6B99);
  static const Color textOnPrimary = Colors.white;

  // Board colors
  static const Color boardLight = Color(0xFFEDD6B0);
  static const Color boardDark = Color(0xFFB88762);
  static const Color boardHighlight = Color(0x8066BB6A);
  static const Color boardDanger = Color(0x80EF5350);
  static const Color boardHint = Color(0x8042A5F5);
  static const Color boardObjective = Color(0x80FFD93D);
  static const Color boardLastMove = Color(0x40FFC107);

  // Gamification
  static const Color xpGold = Color(0xFFFFD700);
  static const Color starFilled = Color(0xFFFFD93D);
  static const Color starEmpty = Color(0xFFD0CDE1);
  static const Color streakFlame = Color(0xFFFF6B35);
  static const Color coinGold = Color(0xFFF4C430);

  // Rank colors
  static const Color rankWood = Color(0xFF8B6914);
  static const Color rankBronze = Color(0xFFCD7F32);
  static const Color rankSilver = Color(0xFFC0C0C0);
  static const Color rankGold = Color(0xFFFFD700);
  static const Color rankPlatinum = Color(0xFFE5E4E2);
  static const Color rankDiamond = Color(0xFFB9F2FF);

  // Feedback
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFEF5350);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF42A5F5);

  // World map colors
  static const Color world1 = Color(0xFF66BB6A); // The Kingdom - green
  static const Color world2 = Color(0xFF42A5F5); // Rules of Battle - blue
  static const Color world3 = Color(0xFFFF7043); // The Strategist - orange
  static const Color world4 = Color(0xFFAB47BC); // Grandmaster's Path - purple
  static const Color world5 = Color(0xFFEF5350); // Master's Domain - red
}
