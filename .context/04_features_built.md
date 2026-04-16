# Features Built & Current State

## Final Stats (as of April 16, 2026)
- 87 Dart source files, ~10,300 lines of code
- 5 test files, 38 test cases (all passing)
- `flutter analyze` — 0 issues
- `flutter build web` — successful
- 125 bundled puzzles across 8 themes
- 12 synthesized WAV sound effects
- App icons generated for Android, iOS, and web

## Feature Inventory

### Profile System
- Up to 4 child profiles with name, avatar (8 emoji options), and age
- Profile selection screen, create profile screen
- Active profile tracked in database
- Files: `lib/features/auth/`

### Interactive Chessboard (`AnimatedChessboard`)
- Wraps `squares` Board widget with overlays
- Square highlighting (green/red/gold/blue for valid/danger/objective/hint)
- Arrow overlay via CustomPaint
- Coordinate labels
- Guided mode (only accepted moves allowed)
- Sound integration (move/capture/check sounds on each move)
- File: `lib/core/widgets/animated_chessboard.dart`

### Lesson Engine
- `LessonController` (Notifier) drives step-by-step lesson progression
- `activeLessonProvider` holds current lesson
- Tracks wrong attempts per step and total
- Shows hints after 2 wrong attempts
- Calculates stars: 0 wrong = 3 stars, 1-2 = 2 stars, 3+ = 1 star
- Auto-advances on correct WaitForMove/WaitForTap/Quiz steps via FeedbackOverlay
- Files: `lib/features/curriculum/presentation/providers/lesson_state_provider.dart`

### Curriculum Widgets
- `MascotBubble` — speech bubble with emotion-based emoji
- `FeedbackOverlay` — animated success/error toast, auto-dismisses after 1.5s, plays sound
- `QuizWidget` — A/B/C/D multiple choice with correct-answer reveal
- `StarResultDialog` — 3-star display with staggered elastic animations + sound per star

### Chapter Progress
- Saved to Drift database on chapter completion
- Awards XP and coins to profile
- Unlocks next chapter automatically
- `ProgressSaver` notifier handles all DB writes
- File: `lib/features/curriculum/presentation/providers/chapter_progress_provider.dart`

### Play vs AI
- `GameController` (Notifier) manages full game state machine
- Player move → validate → update board → AI thinks → AI moves → update board
- 6 difficulty levels with configurable search depth and random-move probability
- Resign and exit dialogs
- Game over card with play-again option
- Files: `lib/features/play/`

### AI Engine
- `DartMinimaxEngine` — pure Dart, alpha-beta pruning
- Uses bishop package for legal move generation
- Material evaluation (piece values) — no piece-square tables (removed due to 0x88 complexity)
- Configurable depth 1-6
- `getBestMoveWithRandomness()` for easier levels (30% random at Pawn, 0% at Rook+)
- File: `lib/features/engine/data/dart_minimax_engine.dart`

### Puzzle System
- 125 bundled puzzles in `lib/features/puzzles/data/bundled_puzzles.dart`
- Themes: mate_in_1 (25), forks (20), pins (15), skewers (10), mate_in_2 (15), discovered_attacks (10), deflections (10), promotions (10), back_rank (10)
- `PuzzleController` validates moves against solution sequence
- 3 attempts per puzzle, opponent auto-play for multi-move solutions
- Theme filtering: `loadThemePuzzle(theme)`

### Gamification
- XP, coins (1 coin per 5 XP), 9 ranks (Pawn Apprentice → Grandmaster)
- 14 achievement definitions
- Streak tracking (consecutive days)
- Puzzle rating (simple +15/-10 adjustment)
- `GamificationNotifier` handles all awards/tracking
- File: `lib/features/gamification/presentation/providers/gamification_provider.dart`

### Sound System
- `SoundManager` singleton with `just_audio`
- 12 WAV files generated via Python script (`tool/generate_sounds.py`)
- Integrated into: board moves, feedback overlay, star animations, settings toggles
- Persisted on/off via SharedPreferences
- File: `lib/core/utils/sound_manager.dart`

### Parent Dashboard
- Progress overview (XP, coins, streak)
- Rank progress bar with next-rank target
- Puzzle rating display
- Skill bars (Board Knowledge, Piece Movement, Tactics, Strategy, Endgames)
- Tips for parents section
- File: `lib/features/parent_dashboard/presentation/screens/parent_dashboard_screen.dart`

### Settings
- Sound effects toggle (wired to SoundManager)
- Background music toggle (wired to SoundManager)
- Show coordinates toggle (UI only, not yet wired to board)
- Show legal moves toggle (UI only, not yet wired)
- Notification toggles (UI only, not yet wired)

## Database Schema (Drift)
7 tables: `profiles`, `chapter_progress`, `exercise_results`, `puzzle_attempts`, `game_history`, `achievements`, `inventory`
3 DAOs: `ProfileDao`, `ProgressDao`, `GamificationDao`

## Navigation (GoRouter)
```
/profiles → ProfileSelectionScreen
/profiles/create → CreateProfileScreen
/learn → WorldMapScreen (tab 1)
/learn/:worldId → ChapterListScreen
/learn/:worldId/:chapterId → LessonScreen
/puzzles → PuzzleHubScreen (tab 2)
/puzzles/train → PuzzleScreen
/play → PlayHubScreen (tab 3)
/play/game → GameScreen
/profile → ProfileHubScreen (tab 4)
/settings → SettingsScreen
/parent → ParentDashboardScreen
```
Bottom nav tabs: Learn | Puzzles | Play | Profile
