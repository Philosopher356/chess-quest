import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_provider.dart';
import '../../../auth/presentation/providers/profile_provider.dart';
import '../../domain/entities/rank.dart';

/// Awards XP and coins, updates rank, manages streaks.
class GamificationNotifier extends Notifier<void> {
  @override
  void build() {}

  /// Award XP for any activity (lesson, puzzle, game, etc.).
  Future<void> awardXp(int xp) async {
    final profile = ref.read(activeProfileProvider).value;
    if (profile == null) return;

    final profileDao = ref.read(profileDaoProvider);
    final coins = (xp / 5).round();

    await profileDao.addXp(profile.id, xp, coins);

    // Check for rank up
    final newTotalXp = profile.totalXp + xp;
    final newRank = Rank.fromXp(newTotalXp);
    if (newRank.level > profile.currentRank) {
      await profileDao.updateRank(profile.id, newRank.level);
    }

    // Update streak
    await _updateStreak(profile.id);

    ref.invalidate(activeProfileProvider);
  }

  /// Award XP for winning an AI game.
  Future<void> recordGameResult({
    required String pgn,
    required int result,
    required int aiDifficulty,
  }) async {
    final profile = ref.read(activeProfileProvider).value;
    if (profile == null) return;

    final gamificationDao = ref.read(gamificationDaoProvider);
    await gamificationDao.saveGameResult(
      profile.id,
      pgn: pgn,
      result: result,
      aiDifficulty: aiDifficulty,
    );

    // XP based on result
    final xp = switch (result) {
      2 => 50, // win
      1 => 20, // draw
      _ => 10, // loss (participation XP)
    };

    await awardXp(xp);
  }

  /// Award XP for solving a puzzle.
  Future<void> recordPuzzleSolved({
    required String puzzleId,
    required String fen,
    required String moves,
    required bool solved,
    int? timeMs,
    required int puzzleRating,
  }) async {
    final profile = ref.read(activeProfileProvider).value;
    if (profile == null) return;

    final gamificationDao = ref.read(gamificationDaoProvider);
    final profileDao = ref.read(profileDaoProvider);

    // Simple rating adjustment
    final ratingChange = solved ? 15 : -10;
    final newRating = (profile.puzzleRating + ratingChange).clamp(100, 3000);

    await gamificationDao.savePuzzleAttempt(
      profile.id,
      puzzleId: puzzleId,
      fen: fen,
      moves: moves,
      solved: solved,
      timeMs: timeMs,
      ratingChange: ratingChange,
    );

    await profileDao.updatePuzzleRating(profile.id, newRating);

    if (solved) {
      await awardXp(15);
    }

    ref.invalidate(activeProfileProvider);
  }

  Future<void> _updateStreak(int profileId) async {
    final profileDao = ref.read(profileDaoProvider);
    final profile = ref.read(activeProfileProvider).value;
    if (profile == null) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDate = profile.streakLastDate;

    if (lastDate == null) {
      // First activity ever
      await profileDao.updateStreak(profileId, 1);
      return;
    }

    final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
    final diff = today.difference(lastDay).inDays;

    if (diff == 0) {
      // Already logged today, no change
      return;
    } else if (diff == 1) {
      // Consecutive day
      await profileDao.updateStreak(profileId, profile.streakCount + 1);
    } else {
      // Streak broken, reset to 1
      await profileDao.updateStreak(profileId, 1);
    }
  }

  /// Check and unlock an achievement.
  Future<bool> checkAchievement(String key) async {
    final profile = ref.read(activeProfileProvider).value;
    if (profile == null) return false;

    final gamificationDao = ref.read(gamificationDaoProvider);
    final hasIt = await gamificationDao.hasAchievement(profile.id, key);
    if (hasIt) return false;

    await gamificationDao.unlockAchievement(profile.id, key);
    return true; // Newly unlocked
  }
}

final gamificationProvider =
    NotifierProvider<GamificationNotifier, void>(GamificationNotifier.new);

/// List of all possible achievements.
class AchievementDefinition {
  final String key;
  final String title;
  final String description;
  final String icon;

  const AchievementDefinition({
    required this.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  static const all = [
    AchievementDefinition(
      key: 'first_lesson',
      title: 'First Steps',
      description: 'Complete your first lesson',
      icon: '🎯',
    ),
    AchievementDefinition(
      key: 'world1_complete',
      title: 'Piece Collector',
      description: 'Learn all 6 chess pieces',
      icon: '♟',
    ),
    AchievementDefinition(
      key: 'world2_complete',
      title: 'Rule Master',
      description: 'Complete all rules lessons',
      icon: '📜',
    ),
    AchievementDefinition(
      key: 'first_win',
      title: 'First Victory',
      description: 'Win your first AI game',
      icon: '🏆',
    ),
    AchievementDefinition(
      key: 'streak_7',
      title: 'Streak Warrior',
      description: 'Maintain a 7-day streak',
      icon: '🔥',
    ),
    AchievementDefinition(
      key: 'streak_30',
      title: 'Streak Legend',
      description: 'Maintain a 30-day streak',
      icon: '🌟',
    ),
    AchievementDefinition(
      key: 'puzzles_10',
      title: 'Puzzle Beginner',
      description: 'Solve 10 puzzles',
      icon: '🧩',
    ),
    AchievementDefinition(
      key: 'puzzles_50',
      title: 'Puzzle Master',
      description: 'Solve 50 puzzles',
      icon: '🧠',
    ),
    AchievementDefinition(
      key: 'puzzles_100',
      title: 'Puzzle Champion',
      description: 'Solve 100 puzzles',
      icon: '💎',
    ),
    AchievementDefinition(
      key: 'rank_knight',
      title: 'Knight Promotion',
      description: 'Reach Knight Squire rank',
      icon: '♞',
    ),
    AchievementDefinition(
      key: 'rank_queen',
      title: "Queen's Guard",
      description: "Reach Queen's Guard rank",
      icon: '♛',
    ),
    AchievementDefinition(
      key: 'rank_grandmaster',
      title: 'Grandmaster',
      description: 'Reach the Grandmaster rank',
      icon: '👑',
    ),
    AchievementDefinition(
      key: 'perfect_chapter',
      title: 'Perfect Score',
      description: 'Get 3 stars on every lesson in a chapter',
      icon: '⭐',
    ),
    AchievementDefinition(
      key: 'speed_demon',
      title: 'Speed Demon',
      description: 'Solve 10 puzzles in under 60 seconds each',
      icon: '⚡',
    ),
  ];
}
