import 'package:drift/drift.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get avatarId => integer().withDefault(const Constant(0))();
  IntColumn get age => integer().withDefault(const Constant(5))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get totalXp => integer().withDefault(const Constant(0))();
  IntColumn get currentRank => integer().withDefault(const Constant(0))();
  IntColumn get coinBalance => integer().withDefault(const Constant(0))();
  IntColumn get puzzleRating => integer().withDefault(const Constant(600))();
  IntColumn get streakCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get streakLastDate => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
}
