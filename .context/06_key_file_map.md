# Key File Map

Quick reference to the most important files when continuing work.

## Core
- `lib/main.dart` — Entry point, initializes SoundManager
- `lib/app.dart` — MaterialApp with ProviderScope + GoRouter
- `lib/core/router/app_router.dart` — All routes defined here
- `lib/core/constants/app_colors.dart` — Full color palette
- `lib/core/constants/app_theme.dart` — Material theme config
- `lib/core/constants/app_typography.dart` — Text styles (Nunito font)
- `lib/core/widgets/home_shell.dart` — Bottom navigation bar shell
- `lib/core/widgets/animated_chessboard.dart` — **THE** board widget (wraps squares package)
- `lib/core/utils/sound_manager.dart` — Singleton audio manager
- `lib/core/providers/database_provider.dart` — Drift DB + DAO providers
- `lib/core/providers/engine_provider.dart` — AI engine provider

## Database
- `lib/database/app_database.dart` — Drift database definition (7 tables, 3 DAOs)
- `lib/database/connection/native.dart` — Mobile DB connection (LazyDatabase + NativeDatabase)
- `lib/database/connection/web.dart` — Web DB connection (WebDatabase/IndexedDB)
- `lib/database/daos/profile_dao.dart` — Profile CRUD, XP, streaks
- `lib/database/daos/progress_dao.dart` — Chapter progress, exercise results
- `lib/database/daos/gamification_dao.dart` — Achievements, inventory, puzzles, game history

## Curriculum (the learning system)
- `lib/features/curriculum/domain/entities/lesson.dart` — **9 lesson step types** (sealed classes)
- `lib/features/curriculum/domain/entities/chapter.dart` — All 28 chapter definitions (static lists)
- `lib/features/curriculum/domain/entities/world.dart` — 5 world definitions
- `lib/features/curriculum/data/lesson_content/content_registry.dart` — Maps chapter IDs → lessons
- `lib/features/curriculum/data/lesson_content/chapter*.dart` — 28 content files
- `lib/features/curriculum/presentation/providers/lesson_state_provider.dart` — **Lesson engine** (LessonController + LessonState)
- `lib/features/curriculum/presentation/providers/chapter_progress_provider.dart` — Progress tracking + ProgressSaver
- `lib/features/curriculum/presentation/screens/lesson_screen.dart` — **Main lesson UI** (renders all step types)
- `lib/features/curriculum/presentation/widgets/` — MascotBubble, FeedbackOverlay, QuizWidget, StarResultDialog

## Play vs AI
- `lib/features/engine/domain/engine_interface.dart` — ChessEngine abstract + AiDifficulty enum
- `lib/features/engine/data/dart_minimax_engine.dart` — Pure Dart AI (alpha-beta + bishop)
- `lib/features/engine/data/engine_factory.dart` — Platform-aware factory (TODO: Stockfish for mobile)
- `lib/features/play/presentation/providers/game_provider.dart` — GameController + GameState
- `lib/features/play/presentation/screens/game_screen.dart` — Full game UI
- `lib/features/play/presentation/screens/play_hub_screen.dart` — Difficulty selection

## Puzzles
- `lib/features/puzzles/domain/entities/puzzle.dart` — ChessPuzzle model
- `lib/features/puzzles/data/bundled_puzzles.dart` — 125 puzzles (8 theme categories)
- `lib/features/puzzles/presentation/providers/puzzle_provider.dart` — PuzzleController
- `lib/features/puzzles/presentation/screens/puzzle_screen.dart` — Puzzle solving UI
- `lib/features/puzzles/presentation/screens/puzzle_hub_screen.dart` — Theme selection hub

## Gamification
- `lib/features/gamification/domain/entities/rank.dart` — 9 ranks with XP thresholds
- `lib/features/gamification/presentation/providers/gamification_provider.dart` — XP/rank/streak/achievements
- `lib/features/gamification/presentation/screens/profile_hub_screen.dart` — Profile page with stats

## Other
- `lib/features/auth/presentation/providers/profile_provider.dart` — ProfileNotifier (AsyncNotifier)
- `lib/features/parent_dashboard/presentation/screens/parent_dashboard_screen.dart` — Parent view
- `lib/features/settings/presentation/screens/settings_screen.dart` — Settings with sound toggles

## Config / CI
- `pubspec.yaml` — Dependencies, assets, fonts
- `analysis_options.yaml` — Lint rules
- `flutter_launcher_icons.yaml` — Icon generation config
- `.github/workflows/ci.yml` — GitHub Actions pipeline
- `android/app/build.gradle.kts` — Android config with release signing support
- `android/key.properties.example` — Template for keystore config

## Tests
- `test/engine/dart_minimax_engine_test.dart` — 7 engine tests
- `test/gamification/rank_test.dart` — 11 rank tests
- `test/curriculum/lesson_controller_test.dart` — 11 lesson controller tests
- `test/puzzles/puzzle_controller_test.dart` — 6 puzzle controller tests

## Tools
- `tool/generate_sounds.py` — Python script that synthesizes all 12 WAV files
