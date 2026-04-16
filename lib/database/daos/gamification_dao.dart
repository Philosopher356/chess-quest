import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/achievements_table.dart';
import '../tables/inventory_table.dart';
import '../tables/puzzle_attempts_table.dart';
import '../tables/game_history_table.dart';

part 'gamification_dao.g.dart';

@DriftAccessor(
    tables: [Achievements, Inventory, PuzzleAttempts, GameHistory])
class GamificationDao extends DatabaseAccessor<AppDatabase>
    with _$GamificationDaoMixin {
  GamificationDao(super.db);

  // Achievements
  Future<List<Achievement>> getAchievements(int profileId) =>
      (select(achievements)..where((t) => t.profileId.equals(profileId)))
          .get();

  Stream<List<Achievement>> watchAchievements(int profileId) =>
      (select(achievements)..where((t) => t.profileId.equals(profileId)))
          .watch();

  Future<bool> hasAchievement(int profileId, String key) async {
    final result = await (select(achievements)
          ..where(
            (t) =>
                t.profileId.equals(profileId) &
                t.achievementKey.equals(key),
          ))
        .getSingleOrNull();
    return result != null;
  }

  Future<void> unlockAchievement(int profileId, String key) async {
    await into(achievements).insertOnConflictUpdate(
      AchievementsCompanion.insert(
        profileId: profileId,
        achievementKey: key,
      ),
    );
  }

  // Inventory
  Future<List<InventoryData>> getInventory(int profileId) =>
      (select(inventory)..where((t) => t.profileId.equals(profileId))).get();

  Future<void> addItem(
    int profileId, {
    required String itemType,
    required String itemKey,
  }) async {
    await into(inventory).insertOnConflictUpdate(
      InventoryCompanion.insert(
        profileId: profileId,
        itemType: itemType,
        itemKey: itemKey,
      ),
    );
  }

  Future<void> equipItem(
    int profileId, {
    required String itemType,
    required String itemKey,
  }) async {
    // Unequip all items of this type first
    await (update(inventory)
          ..where(
            (t) =>
                t.profileId.equals(profileId) & t.itemType.equals(itemType),
          ))
        .write(const InventoryCompanion(isEquipped: Value(false)));
    // Equip the selected item
    await (update(inventory)
          ..where(
            (t) =>
                t.profileId.equals(profileId) &
                t.itemType.equals(itemType) &
                t.itemKey.equals(itemKey),
          ))
        .write(const InventoryCompanion(isEquipped: Value(true)));
  }

  // Puzzle attempts
  Future<void> savePuzzleAttempt(
    int profileId, {
    required String puzzleId,
    required String fen,
    required String moves,
    required bool solved,
    int? timeMs,
    required int ratingChange,
  }) async {
    await into(puzzleAttempts).insert(
      PuzzleAttemptsCompanion.insert(
        profileId: profileId,
        puzzleId: puzzleId,
        puzzleFen: fen,
        puzzleMoves: moves,
        solved: Value(solved),
        timeMs: Value(timeMs),
        ratingChange: Value(ratingChange),
      ),
    );
  }

  Future<int> getPuzzlesSolvedCount(int profileId) async {
    final count = puzzleAttempts.id.count();
    final query = selectOnly(puzzleAttempts)
      ..addColumns([count])
      ..where(
        puzzleAttempts.profileId.equals(profileId) &
            puzzleAttempts.solved.equals(true),
      );
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  // Game history
  Future<void> saveGameResult(
    int profileId, {
    required String pgn,
    required int result,
    required int aiDifficulty,
  }) async {
    await into(gameHistory).insert(
      GameHistoryCompanion.insert(
        profileId: profileId,
        pgn: pgn,
        result: result,
        aiDifficulty: aiDifficulty,
      ),
    );
  }

  Future<List<GameHistoryData>> getRecentGames(
    int profileId, {
    int limit = 20,
  }) =>
      (select(gameHistory)
            ..where((t) => t.profileId.equals(profileId))
            ..orderBy([
              (t) => OrderingTerm.desc(t.playedAt),
            ])
            ..limit(limit))
          .get();
}
