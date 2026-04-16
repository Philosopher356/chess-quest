# Tech Stack & Architecture Decisions

## Dependencies (and why chosen)

| Purpose | Package | Why This One |
|---------|---------|-------------|
| Chess logic | `bishop` | Pure Dart, works on all platforms, FEN/PGN, 0x88 board representation |
| Board UI | `squares` + `square_bishop` | Separate from logic, overlay-friendly, customizable. `square_bishop` bridges the two via extension methods on `Game` |
| AI (all platforms) | Custom `DartMinimaxEngine` | Stockfish FFI doesn't work on web. Pure Dart alpha-beta with bishop move gen is sufficient for kids |
| State management | `flutter_riverpod` v3.3.1 | Less boilerplate than Bloc, natural DI |
| Database | `drift` v2.32.1 (SQLite) | Relational queries for progress tracking, web support via IndexedDB (`WebDatabase`) |
| Routing | `go_router` | Declarative, deep links, nested nav with shell routes |
| Audio | `just_audio` | Cross-platform, supports WAV assets |
| Notifications | `flutter_local_notifications` | Daily reminders (not yet wired) |

## Key Technical Findings

### Riverpod 3.x API
- `StateNotifier` and `StateProvider` are in legacy mode (still work but deprecated)
- Use `Notifier<T>` with `NotifierProvider` instead
- Pattern: `class MyNotifier extends Notifier<MyState> { @override MyState build() {...} }`
- For async: `AsyncNotifier<T>` with `AsyncNotifierProvider`
- No `AutoDisposeNotifier` was needed - used `activeLessonProvider` (Notifier) + `lessonControllerProvider` (Notifier that watches it)

### Bishop Package (0x88 board)
- Board is NOT 0-63 indexed. Uses 0x88 representation: `numIndices = numSquares * 2 = 128`
- Valid squares satisfy `(index & 0x88) == 0`
- Use `game.variant.boardSize.squareName(square)` for algebraic notation, NOT manual `square % 8` math
- `game.board` returns `List<int>` with 0x88 indexing
- Piece inspection: `piece.isEmpty`, `piece.type`, `piece.colour`
- Color constants: `Bishop.white` (0), `Bishop.black` (1)

### Squares + Square_Bishop Bridge
- NO `SquareBishopController` class exists
- Use extension methods: `game.boardState(player)`, `game.squaresMoves(player)`, `game.playState(player)`, `game.makeSquaresMove(move)`
- `BoardController` widget requires: `state` (BoardState), `playState`, `pieceSet`, `moves` (List<Move>)
- `BoardTheme` requires ALL fields: `lightSquare`, `darkSquare`, `check`, `checkmate`, `previous`, `selected`, `premove`
- `PieceSet.merida()` for default piece graphics

### Drift Database
- Web: `WebDatabase('chess_quest_db')` - uses IndexedDB, works out of the box (deprecated but functional)
- Native: `LazyDatabase(() async => NativeDatabase.createInBackground(file))` 
- `AppDatabase(super.e)` accepts `QueryExecutor`
- Code generation: `dart run build_runner build --delete-conflicting-outputs`

## Architecture
Feature-first clean architecture: `data/` → `domain/` → `presentation/` per feature.
See `lib/` folder structure in the README.
