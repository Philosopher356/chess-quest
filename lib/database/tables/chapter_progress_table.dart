import 'package:drift/drift.dart';

class ChapterProgress extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  TextColumn get chapterId => text()();
  // 0=locked, 1=unlocked, 2=in_progress, 3=mastered
  IntColumn get status => integer().withDefault(const Constant(0))();
  IntColumn get starsEarned => integer().withDefault(const Constant(0))();
  IntColumn get bestScore => integer().withDefault(const Constant(0))();
  DateTimeColumn get unlockedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {profileId, chapterId},
      ];
}
