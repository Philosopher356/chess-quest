import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/chapter_progress_table.dart';
import '../tables/exercise_results_table.dart';

part 'progress_dao.g.dart';

@DriftAccessor(tables: [ChapterProgress, ExerciseResults])
class ProgressDao extends DatabaseAccessor<AppDatabase>
    with _$ProgressDaoMixin {
  ProgressDao(super.db);

  // Chapter progress
  Future<List<ChapterProgressData>> getProgressForProfile(int profileId) =>
      (select(chapterProgress)
            ..where((t) => t.profileId.equals(profileId)))
          .get();

  Stream<List<ChapterProgressData>> watchProgressForProfile(int profileId) =>
      (select(chapterProgress)
            ..where((t) => t.profileId.equals(profileId)))
          .watch();

  Future<ChapterProgressData?> getChapterProgress(
    int profileId,
    String chapterId,
  ) =>
      (select(chapterProgress)
            ..where(
              (t) =>
                  t.profileId.equals(profileId) &
                  t.chapterId.equals(chapterId),
            ))
          .getSingleOrNull();

  Future<void> upsertChapterProgress(
    int profileId,
    String chapterId, {
    required int status,
    int? stars,
    int? score,
  }) async {
    await into(chapterProgress).insertOnConflictUpdate(
      ChapterProgressCompanion.insert(
        profileId: profileId,
        chapterId: chapterId,
        status: Value(status),
        starsEarned: Value(stars ?? 0),
        bestScore: Value(score ?? 0),
        unlockedAt: status >= 1
            ? Value(DateTime.now())
            : const Value.absent(),
        completedAt: status >= 3
            ? Value(DateTime.now())
            : const Value.absent(),
      ),
    );
  }

  Future<void> unlockChapter(int profileId, String chapterId) async {
    await upsertChapterProgress(profileId, chapterId, status: 1);
  }

  Future<void> masterChapter(
    int profileId,
    String chapterId, {
    required int stars,
    required int score,
  }) async {
    await upsertChapterProgress(
      profileId,
      chapterId,
      status: 3,
      stars: stars,
      score: score,
    );
  }

  // Exercise results
  Future<ExerciseResult?> getExerciseResult(
    int profileId,
    String exerciseId,
  ) =>
      (select(exerciseResults)
            ..where(
              (t) =>
                  t.profileId.equals(profileId) &
                  t.exerciseId.equals(exerciseId),
            ))
          .getSingleOrNull();

  Future<List<ExerciseResult>> getExerciseResultsForChapter(
    int profileId,
    String chapterPrefix,
  ) =>
      (select(exerciseResults)
            ..where(
              (t) =>
                  t.profileId.equals(profileId) &
                  t.exerciseId.like('$chapterPrefix%'),
            ))
          .get();

  Future<void> saveExerciseResult(
    int profileId,
    String exerciseId, {
    required int attempts,
    int? timeMs,
    required int stars,
  }) async {
    await into(exerciseResults).insertOnConflictUpdate(
      ExerciseResultsCompanion.insert(
        profileId: profileId,
        exerciseId: exerciseId,
        attempts: Value(attempts),
        bestTimeMs: Value(timeMs),
        stars: Value(stars),
        completedAt: Value(DateTime.now()),
      ),
    );
  }
}
