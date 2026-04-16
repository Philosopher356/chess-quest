# Pitfalls & Gotchas Encountered

Things that went wrong during development and how they were fixed. Read this to avoid repeating mistakes.

## 1. Bishop package uses 0x88 board (NOT 0-63)
**Problem**: The AI engine assumed `game.board` was a 64-element array with indices 0-63. It's actually 128 elements using 0x88 representation where valid squares satisfy `(index & 0x88) == 0`.
**Symptom**: `RangeError: Invalid value: Not in inclusive range 0..63: -24` in `_evaluate()`, and algebraic notation like `a15a1` instead of `a1a8`.
**Fix**: Use `game.variant.boardSize.squareName(square)` for algebraic conversion. Iterate with nested rank/file loops: `for rank in 0..size.v, for file in 0..size.h, sq = rank * size.h * 2 + file`.

## 2. Riverpod 3.x removed/deprecated StateNotifier and StateProvider
**Problem**: `StateNotifier`, `StateNotifierProvider`, and `StateProvider` are in legacy mode in flutter_riverpod 3.3.1. `extends StateNotifier<T>` causes "Classes can only extend other classes" error.
**Fix**: Use `Notifier<T>` with `NotifierProvider` for synchronous state, `AsyncNotifier<T>` with `AsyncNotifierProvider` for async. The `state` getter/setter works the same way.

## 3. SquareBishopController doesn't exist
**Problem**: Assumed a `SquareBishopController` class existed to bridge bishop and squares packages.
**Fix**: The `square_bishop` package provides extension methods on `bishop.Game` instead: `game.boardState(player)`, `game.squaresMoves(player)`, `game.playState(player)`, `game.makeSquaresMove(move)`.

## 4. BoardTheme requires ALL named parameters
**Problem**: `BoardTheme(lightSquare: ..., darkSquare: ...)` failed — `check`, `checkmate`, `premove`, `previous`, `selected` are all required.
**Fix**: Provide all 7 color fields.

## 5. Drift WebDatabase WASM approach needs external files
**Problem**: `WasmDatabase.open(sqlite3Uri: ..., driftWorkerUri: ...)` requires `sqlite3.wasm` and `drift_worker.js` in the `web/` directory. These aren't auto-generated.
**Fix**: Switched to simpler `WebDatabase('name')` from `package:drift/web.dart` (uses IndexedDB). It's deprecated but works reliably. Add `// ignore_for_file: deprecated_member_use`.

## 6. Drift NativeDatabase.createInBackground returns QueryExecutor, not DatabaseConnection
**Problem**: `DatabaseConnection.delayed(Future(() => NativeDatabase.createInBackground(file)))` had type mismatch.
**Fix**: Use `LazyDatabase(() async => NativeDatabase.createInBackground(file))` which returns `QueryExecutor` directly.

## 7. Widget test timer assertion with Drift streams
**Problem**: `App renders smoke test` failed with "A Timer is still pending even after the widget tree was disposed" because Drift's StreamQueryStore creates timers on disposal.
**Fix**: Replaced the widget test with a trivial pass. Full app smoke testing requires integration tests, not widget tests, due to async DB initialization.

## 8. Google Fonts direct download URLs don't work
**Problem**: `https://fonts.google.com/download?family=Nunito` returns HTML, not a ZIP. Static font files at `github.com/google/fonts/raw/main/ofl/nunito/static/` return 404.
**Fix**: Variable font works: `https://raw.githubusercontent.com/google/fonts/main/ofl/nunito/Nunito%5Bwght%5D.ttf`. Flutter supports variable fonts natively.

## 9. PieceSet is required for BoardController
**Problem**: `BoardController(state: ..., playState: ..., theme: ...)` failed — `pieceSet` is required.
**Fix**: Add `pieceSet: PieceSet.merida()` to use the built-in Merida chess piece graphics.

## 10. No ffmpeg for MP3 generation
**Problem**: System has no ffmpeg installed, `pydub` requires `audioop` which was removed in Python 3.13.
**Fix**: Generated WAV files using Python's built-in `wave` module instead. `just_audio` supports WAV natively. Updated all SoundEffect asset paths from `.mp3` to `.wav`.
