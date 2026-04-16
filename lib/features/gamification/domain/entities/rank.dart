import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

enum Rank {
  pawnApprentice(0, 'Pawn Apprentice', 0, 200, AppColors.rankWood, '♟'),
  pawnSoldier(1, 'Pawn Soldier', 200, 500, AppColors.rankBronze, '♟'),
  knightSquire(2, 'Knight Squire', 500, 1000, AppColors.rankWood, '♞'),
  knightChampion(3, 'Knight Champion', 1000, 2000, AppColors.rankSilver, '♞'),
  bishopScholar(4, 'Bishop Scholar', 2000, 3500, AppColors.rankBronze, '♝'),
  rookDefender(5, 'Rook Defender', 3500, 5500, AppColors.rankSilver, '♜'),
  queensGuard(6, "Queen's Guard", 5500, 8000, AppColors.rankGold, '♛'),
  kingsAdvisor(7, "King's Advisor", 8000, 12000, AppColors.rankPlatinum, '♚'),
  grandmaster(8, 'Grandmaster', 12000, 999999, AppColors.rankDiamond, '👑');

  const Rank(
    this.level,
    this.displayName,
    this.minXp,
    this.maxXp,
    this.color,
    this.icon,
  );

  final int level;
  final String displayName;
  final int minXp;
  final int maxXp;
  final Color color;
  final String icon;

  double progressToNext(int currentXp) {
    if (this == Rank.grandmaster) return 1.0;
    final range = maxXp - minXp;
    final progress = currentXp - minXp;
    return (progress / range).clamp(0.0, 1.0);
  }

  static Rank fromXp(int xp) {
    for (final rank in Rank.values.reversed) {
      if (xp >= rank.minXp) return rank;
    }
    return Rank.pawnApprentice;
  }

  Rank? get nextRank {
    if (level >= Rank.values.length - 1) return null;
    return Rank.values[level + 1];
  }
}
