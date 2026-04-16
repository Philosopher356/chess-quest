# Remaining Work & Known Issues

## Production-Ready (Done)
- [x] Nunito font (variable weight TTF)
- [x] Drift web DB (IndexedDB via WebDatabase)
- [x] Removed unused flutter_screenutil
- [x] 12 WAV sound effects generated and integrated
- [x] App icons for all platforms (via flutter_launcher_icons)
- [x] Android: "Chess Quest" label, INTERNET permission, release signing config
- [x] Web: title, description, theme-color, PWA manifest updated
- [x] .gitignore: key.properties, *.jks, .env excluded
- [x] GitHub Actions CI/CD (analyze, test, build-web, build-android)
- [x] 38 unit tests passing (engine, rank, lesson controller, puzzle controller)
- [x] README, PRIVACY_POLICY.md, analysis_options.yaml hardened

## Not Yet Done (for future sessions)

### High Priority
1. **Stockfish integration for mobile** — `stockfish_chess_engine` package for Android/iOS FFI. Currently all platforms use DartMinimaxEngine. The engine factory at `lib/features/engine/data/engine_factory.dart` has a TODO for this.
2. **Settings toggles not fully wired** — "Show Coordinates" and "Show Legal Moves" toggles in SettingsScreen exist but don't persist or affect the board widget. Need a `SettingsNotifier` provider.
3. **Notification system** — `flutter_local_notifications` is installed but never initialized or used. Daily challenge reminders and streak warnings are in the settings UI but non-functional.
4. **CaptureChallenge exercise engine** — The `CaptureChallenge` lesson step type is defined but the LessonScreen doesn't have special handling for it (it renders the board but doesn't track captures or count moves). Needs a mini-game mode.
5. **CoordinateQuiz mini-game** — Defined as a step type but no rendering implementation. Needs a timed coordinate-tapping widget.

### Medium Priority
6. **Expand puzzles to 500+** — Plan was to import from Lichess puzzle CSV. Script location: `tool/import_puzzles.dart` (not yet created). Current: 125 puzzles.
7. **Splash screen** — `flutter_native_splash` was planned but not added. Config file `flutter_native_splash.yaml` not created.
8. **iOS Podfile** — iOS deployment target should be set to 13.0 minimum. Not yet done.
9. **Real audio files** — Current WAVs are synthesized sine waves. They work but sound robotic. Replace with proper recorded/designed sounds from Pixabay or freesound.org.
10. **Game review screen** — Route exists in plan (`/play/review/:gameId`) but screen not built. Should show move-by-move replay with mistake highlights.

### Low Priority
11. **Shop screen** — Shell exists but no items/purchasing logic implemented
12. **Achievements screen** — Achievement definitions exist but no UI to display them (only the list in gamification_provider.dart)
13. **Daily challenge** — Puzzle hub has "Daily Challenge" button that navigates to the trainer but doesn't select a specific daily puzzle
14. **Streak freeze items** — Mentioned in plan but not implemented
15. **Dark theme** — Only light theme exists
16. **Accessibility** — No screen reader labels, no high-contrast mode
17. **Localization / i18n** — All strings are hardcoded in English

## Known Technical Issues
1. **Board interaction on WaitForTapStep** — The LessonScreen renders the board but `WaitForTapStep` requires tapping a specific square. The `AnimatedChessboard` doesn't expose a square-tap callback separate from moves. Need to add an `onSquareTap` callback.
2. **FreePlayStep has no completion trigger** — The "Continue" button shows, but there's no way to auto-complete after a duration or capture objective.
3. **Progress not shown on ChapterListScreen** — Stars display but are always empty (grey). The `chapterProgressProvider` exists but isn't wired into the chapter list UI.
4. **Profile deletion** — No UI for deleting profiles (only creating/selecting). The DAO method exists.
5. **Web database deprecation** — Using deprecated `drift/web.dart` `WebDatabase`. Should migrate to WASM-based approach when drift's WASM support is easier to set up (requires hosting sqlite3.wasm + drift_worker.js).
