// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dao.dart';

// ignore_for_file: type=lint
mixin _$ProgressDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChapterProgressTable get chapterProgress => attachedDatabase.chapterProgress;
  $ExerciseResultsTable get exerciseResults => attachedDatabase.exerciseResults;
  ProgressDaoManager get managers => ProgressDaoManager(this);
}

class ProgressDaoManager {
  final _$ProgressDaoMixin _db;
  ProgressDaoManager(this._db);
  $$ChapterProgressTableTableManager get chapterProgress =>
      $$ChapterProgressTableTableManager(
        _db.attachedDatabase,
        _db.chapterProgress,
      );
  $$ExerciseResultsTableTableManager get exerciseResults =>
      $$ExerciseResultsTableTableManager(
        _db.attachedDatabase,
        _db.exerciseResults,
      );
}
