import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_provider.dart';
import '../../../../database/app_database.dart';
import '../../../auth/presentation/providers/profile_provider.dart';

/// Provides the progress data for all chapters for the active profile.
final chapterProgressProvider =
    FutureProvider<Map<String, ChapterProgressData>>((ref) async {
  final profileAsync = ref.watch(activeProfileProvider);
  final profile = profileAsync.value;
  if (profile == null) return {};

  final progressDao = ref.watch(progressDaoProvider);
  final progressList = await progressDao.getProgressForProfile(profile.id);

  return {
    for (final p in progressList) p.chapterId: p,
  };
});

/// Notifier to save progress after completing lessons/chapters.
class ProgressSaver extends Notifier<void> {
  @override
  void build() {}

  Future<void> completeLesson({
    required String chapterId,
    required int stars,
    required int xpEarned,
  }) async {
    final profileAsync = ref.read(activeProfileProvider);
    final profile = profileAsync.value;
    if (profile == null) return;

    final progressDao = ref.read(progressDaoProvider);
    final profileDao = ref.read(profileDaoProvider);

    // Update chapter progress
    await progressDao.upsertChapterProgress(
      profile.id,
      chapterId,
      status: 3, // mastered
      stars: stars,
      score: xpEarned,
    );

    // Award XP and coins
    final coins = (xpEarned / 5).round();
    await profileDao.addXp(profile.id, xpEarned, coins);

    // Invalidate to refresh UI
    ref.invalidate(chapterProgressProvider);
    ref.invalidate(activeProfileProvider);
  }

  Future<void> unlockNextChapter(String currentChapterId) async {
    final profileAsync = ref.read(activeProfileProvider);
    final profile = profileAsync.value;
    if (profile == null) return;

    final chapterNum = int.tryParse(currentChapterId.replaceFirst('ch', ''));
    if (chapterNum == null) return;

    final nextChapterId = 'ch${chapterNum + 1}';
    final progressDao = ref.read(progressDaoProvider);
    await progressDao.unlockChapter(profile.id, nextChapterId);

    ref.invalidate(chapterProgressProvider);
  }
}

final progressSaverProvider =
    NotifierProvider<ProgressSaver, void>(ProgressSaver.new);
