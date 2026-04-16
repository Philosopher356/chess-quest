import 'package:drift/drift.dart';

class PuzzleAttempts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  TextColumn get puzzleId => text()();
  TextColumn get puzzleFen => text()();
  TextColumn get puzzleMoves => text()();
  BoolColumn get solved => boolean().withDefault(const Constant(false))();
  IntColumn get timeMs => integer().nullable()();
  IntColumn get ratingChange => integer().withDefault(const Constant(0))();
  DateTimeColumn get attemptedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
