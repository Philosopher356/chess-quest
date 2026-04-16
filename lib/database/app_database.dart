import 'package:drift/drift.dart';

import 'tables/profiles_table.dart';
import 'tables/chapter_progress_table.dart';
import 'tables/exercise_results_table.dart';
import 'tables/puzzle_attempts_table.dart';
import 'tables/game_history_table.dart';
import 'tables/achievements_table.dart';
import 'tables/inventory_table.dart';
import 'daos/progress_dao.dart';
import 'daos/profile_dao.dart';
import 'daos/gamification_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Profiles,
    ChapterProgress,
    ExerciseResults,
    PuzzleAttempts,
    GameHistory,
    Achievements,
    Inventory,
  ],
  daos: [
    ProfileDao,
    ProgressDao,
    GamificationDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
