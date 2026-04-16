import 'package:drift/drift.dart';

class Achievements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  TextColumn get achievementKey => text()();
  DateTimeColumn get unlockedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {profileId, achievementKey},
      ];
}
