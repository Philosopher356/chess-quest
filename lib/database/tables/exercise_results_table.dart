import 'package:drift/drift.dart';

class ExerciseResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  TextColumn get exerciseId => text()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  IntColumn get bestTimeMs => integer().nullable()();
  IntColumn get stars => integer().withDefault(const Constant(0))();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {profileId, exerciseId},
      ];
}
