import 'package:drift/drift.dart';

class GameHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  TextColumn get pgn => text()();
  // 0=loss, 1=draw, 2=win
  IntColumn get result => integer()();
  IntColumn get aiDifficulty => integer()();
  DateTimeColumn get playedAt => dateTime().withDefault(currentDateAndTime)();
}
