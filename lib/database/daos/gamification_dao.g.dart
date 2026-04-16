// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_dao.dart';

// ignore_for_file: type=lint
mixin _$GamificationDaoMixin on DatabaseAccessor<AppDatabase> {
  $AchievementsTable get achievements => attachedDatabase.achievements;
  $InventoryTable get inventory => attachedDatabase.inventory;
  $PuzzleAttemptsTable get puzzleAttempts => attachedDatabase.puzzleAttempts;
  $GameHistoryTable get gameHistory => attachedDatabase.gameHistory;
  GamificationDaoManager get managers => GamificationDaoManager(this);
}

class GamificationDaoManager {
  final _$GamificationDaoMixin _db;
  GamificationDaoManager(this._db);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db.attachedDatabase, _db.achievements);
  $$InventoryTableTableManager get inventory =>
      $$InventoryTableTableManager(_db.attachedDatabase, _db.inventory);
  $$PuzzleAttemptsTableTableManager get puzzleAttempts =>
      $$PuzzleAttemptsTableTableManager(
        _db.attachedDatabase,
        _db.puzzleAttempts,
      );
  $$GameHistoryTableTableManager get gameHistory =>
      $$GameHistoryTableTableManager(_db.attachedDatabase, _db.gameHistory);
}
