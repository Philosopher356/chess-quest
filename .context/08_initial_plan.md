# Initial Implementation Plan (Approved)

This was the first plan presented and approved before any code was written.

---

## Technical Stack

| Purpose | Package | Rationale |
|---------|---------|-----------|
| Chess logic | `bishop` | Pure Dart, works on all platforms, FEN/PGN support |
| Board UI | `squares` + `square_bishop` | Customizable, separate from logic, overlay-friendly |
| AI (mobile) | `stockfish_chess_engine` | Stockfish via FFI, adjustable difficulty |
| AI (web) | Custom Dart minimax | Stockfish FFI doesn't work on web; pure Dart alpha-beta with bishop move generation |
| State management | `flutter_riverpod` | Less boilerplate than Bloc, natural DI |
| Database | `drift` (SQLite) | Relational queries for progress tracking, strong web support via sql.js |
| Key-value | `shared_preferences` | Settings, streaks, timestamps |
| Routing | `go_router` | Declarative, deep links, nested nav |
| Animations | `rive` or `lottie` | Character animations, celebrations |
| Audio | `just_audio` | Cross-platform move sounds, music, voice clips |
| Notifications | `flutter_local_notifications` | Daily reminders, streak nudges |
| DI | `get_it` + `injectable` | Singleton registration outside widget tree |
| Responsive UI | `flutter_screenutil` | Consistent sizing across devices |
| SVG pieces | `flutter_svg` | Custom/unlockable piece sets |

## Architecture: Feature-First Clean Architecture

```
lib/
  main.dart
  app.dart                          # MaterialApp + ProviderScope + GoRouter

  core/
    constants/                      # Colors, typography, board themes, piece sets
    extensions/                     # Context, bishop type extensions
    utils/                          # FEN helpers, sound manager, haptic manager
    widgets/                        # Shared: animated_chessboard, reward_popup,
                                    #   xp_bar, star_rating, mascot_widget, hint_bubble

  features/
    auth/                           # Profile creation/selection (up to 4 child profiles)
    curriculum/                     # The learning journey (worlds, chapters, lessons, exercises)
    interactive_board/              # Teaching board with overlays, arrows, highlights
    puzzles/                        # Puzzle hub, daily puzzle, tactics trainer
    play/                           # Play vs AI with difficulty selection
    engine/                         # AI engine abstraction (Stockfish mobile / Dart minimax web)
    gamification/                   # XP, ranks, achievements, streaks, daily challenges
    shop/                           # Unlockable cosmetics (coins, no real money)
    parent_dashboard/               # PIN-protected progress charts, time settings
    settings/                       # Sound, music, notifications, theme

  database/
    app_database.dart               # Drift database definition
    tables/                         # profiles, chapter_progress, exercise_results,
                                    #   puzzle_attempts, game_history, achievements, inventory
    daos/                           # progress_dao, puzzle_dao, gamification_dao
```

Each feature follows clean architecture: `data/` (datasources, models, repos) -> `domain/` (entities, repo interfaces, usecases) -> `presentation/` (providers, screens, widgets).

## Database Schema (Drift)

- **profiles**: id, name, avatar_id, created_at, total_xp, current_rank, coin_balance, puzzle_rating, streak_count, streak_last_date
- **chapter_progress**: id, profile_id, chapter_id, status (locked/unlocked/in_progress/mastered), stars_earned, best_score, unlocked_at, completed_at
- **exercise_results**: id, profile_id, exercise_id, attempts, best_time_ms, stars, completed_at
- **puzzle_attempts**: id, profile_id, puzzle_fen, puzzle_moves, solved, time_ms, rating_change, attempted_at
- **game_history**: id, profile_id, pgn, result, ai_difficulty, date
- **achievements**: id, profile_id, achievement_key, unlocked_at
- **inventory**: id, profile_id, item_type, item_key, is_equipped

## Gamification System

### Ranks (XP-based)
| XP | Rank | Icon |
|----|------|------|
| 0-200 | Pawn Apprentice | Wooden pawn |
| 200-500 | Pawn Soldier | Bronze pawn |
| 500-1000 | Knight Squire | Wooden knight |
| 1000-2000 | Knight Champion | Silver knight |
| 2000-3500 | Bishop Scholar | Bronze bishop |
| 3500-5500 | Rook Defender | Silver rook |
| 5500-8000 | Queen's Guard | Gold queen |
| 8000-12000 | King's Advisor | Platinum crown |
| 12000+ | Grandmaster | Diamond crown |

### XP Sources
- Lesson completion: 20-50 XP
- Exercise 3-star: 30 XP
- Puzzle solved: 10-25 XP (by difficulty)
- AI game win: 50 XP
- Daily challenge: 40 XP
- Streak bonus: 10 x streak_days XP

### Coins & Shop
- ~1 coin per 5 XP earned
- Board themes: 200-500 coins
- Piece sets: 300-800 coins
- Mascot outfits: 100-300 coins
- No real money transactions

### Achievements (50+)
Examples: "First Move", "Fork Master" (50 forks), "Streak Warrior" (7-day), "Endgame Expert" (K+R mate in <20), "Speed Demon" (10 puzzles <60s each), "Untouchable" (win without losing pieces)

### Streak System
- Consecutive days with 1+ activity
- Growing flame icon
- Streak freeze items purchasable with coins (max 2 stored)
- Calendar sticker view

## Adaptive Difficulty

- **Puzzle Rating**: Glicko-2 starting at 600. Puzzles selected within +/- 100 of player rating
- **Curriculum**: 3 failures -> simpler variant/review. 3-star first attempts -> offer skip-ahead test
- **AI Levels**: Pawn (depth 1, 30% random), Knight (depth 2, 15%), Bishop (depth 3, 5%), Rook (depth 4), Queen (depth 5), King (depth 6+). Auto-suggest level change after 3 consecutive wins/losses

## Screen Architecture & Navigation

```
/                               -> SplashScreen
/profiles                       -> ProfileSelectionScreen
/profiles/create                -> CreateProfileScreen
/home                           -> HomeScreen (bottom nav shell)
  /home/learn                   -> WorldMapScreen (tab 1)
    /home/learn/:worldId        -> ChapterListScreen
    /home/learn/:worldId/:chId  -> LessonScreen / ExerciseScreen
  /home/puzzles                 -> PuzzleHubScreen (tab 2)
    /home/puzzles/daily         -> DailyPuzzleScreen
    /home/puzzles/train         -> PuzzleScreen (adaptive)
  /home/play                    -> DifficultySelectionScreen (tab 3)
    /home/play/game             -> PlayScreen
    /home/play/review/:gameId   -> GameReviewScreen
  /home/profile                 -> ProfileScreen (tab 4)
    /home/profile/achievements  -> AchievementsScreen
    /home/profile/rank          -> RankProgressionScreen
    /home/profile/shop          -> ShopScreen
/parent                         -> ParentPINScreen -> ParentDashboardScreen
/settings                       -> SettingsScreen
/minigame/:type                 -> MiniGameScreen
```

Bottom tabs: **Learn** | **Puzzles** | **Play** | **Profile**

## AI Engine Architecture

```dart
abstract class ChessEngine {
  Future<void> init();
  Future<String> getBestMove(String fen, {int depth, int timeMs});
  Future<int> evaluate(String fen);
  void dispose();
}
```

- **Mobile**: `StockfishEngine` wraps `stockfish_chess_engine`, UCI protocol via isolate
- **Web**: `DartMinimaxEngine` -- alpha-beta pruning + iterative deepening using bishop for move generation. Material + piece-square tables + mobility eval. Depth 1-6 configurable (~1400-1600 Elo at max)
- **Factory**: `kIsWeb ? DartMinimaxEngine() : StockfishEngine()`

## Interactive Board System

`AnimatedChessboard` wraps `squares` Board widget in a `Stack` with:
- Square highlighting (green=valid, red=danger, gold=objective, blue=hint)
- Arrow overlay (`CustomPaint`) for move paths and attack lines
- Piece animations (`AnimatedPositioned` with bounce/shrink effects)
- Guided mode (only specific moves allowed, shake + hint on invalid)
- Ghost pieces (semi-transparent showing possible moves)
- Toggleable coordinate labels (always on for beginners)

## Audio Design
- Move sounds: pickup, drop, capture, check chime, checkmate fanfare
- UI: button tap, star earned, XP gain, achievement unlock, level up
- Background: gentle medieval ambient per world, toggleable
- Mascot: short encouragement clips ("Great move!", "Try again!")
- Managed via singleton `SoundManager` with `just_audio` preloaded pools

## Offline Support
All content, 2000+ bundled puzzles, and AI engine work fully offline. Drift SQLite is local. No network required.

## Implementation Phases

### Phase 1: Foundation (Weeks 1-3)
- Flutter project setup, folder structure, linting
- Drift database with all tables and DAOs
- bishop + squares integration, `AnimatedChessboard` wrapper
- Riverpod providers, GoRouter navigation shell
- Profile creation/selection
- Core theming (kid-friendly colors, responsive layout)

### Phase 2: Curriculum Engine (Weeks 4-6)
- Lesson data model (typed Dart classes, not JSON)
- LessonScreen with step-by-step interactive board
- ExerciseScreen with validation, stars, hints
- Chapter progress tracking, mastery gates
- WorldMapScreen and ChapterListScreen

### Phase 3: Pieces Curriculum (Weeks 7-9)
- World 1 (chapters 1-7) and World 2 (chapters 8-13)
- Mini-games: Pawn Maze, Knight's Tour, Square Hunt
- Mascot with hints and encouragement

### Phase 4: AI & Puzzles (Weeks 10-12)
- Engine abstraction + DartMinimaxEngine (web) + Stockfish (mobile)
- Play vs AI with difficulty selection
- Puzzle system with bundled DB, adaptive rating, daily challenges

### Phase 5: Gamification (Weeks 13-14)
- XP, ranks, coins
- Achievements with unlock popups
- Streak system with calendar
- Shop with unlockable cosmetics
- Celebration animations

### Phase 6: Advanced Curriculum (Weeks 15-18)
- World 3 (tactics), World 4 (strategy), World 5 (expert)
- Game review screen with move analysis

### Phase 7: Polish (Weeks 19-20)
- Parent dashboard with progress charts
- Sound and music integration
- Notifications
- Performance optimization, web testing
- Accessibility review

## Key Technical Decisions

- **bishop+squares over flutter_chess_board**: Separate logic/UI allows custom teaching overlays
- **Drift over Isar/Hive**: Actively maintained, relational queries suit progress data, solid web support
- **Custom Dart engine for web**: Stockfish FFI can't compile to JS; depth 5-6 minimax is sufficient for kids
- **Riverpod over Bloc**: Less boilerplate, natural DI, cleaner for lesson state machines
- **Lesson content as Dart code**: Type-safe, refactorable, no parsing layer needed
