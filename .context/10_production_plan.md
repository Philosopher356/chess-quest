# Production Readiness Plan (Approved & Executed)

This was the second plan, created after the audit of production gaps.

---

## Context
The app had 87 source files, ~10,300 lines of code, all 28 chapters with interactive content, 125 puzzles, AI play, and gamification. The code compiled with 0 analysis issues and built for web. However, the audit revealed critical gaps: missing assets (fonts, audio, icons), no store signing, no CI/CD, broken web DB, unused dependencies, and minimal tests.

## User Decisions
- **Distribution**: All three - Play Store, App Store, and Web
- **Audio**: Use free sound libraries (ended up generating with Python)
- **Testing**: Core logic tests only (highest ROI)
- **CI/CD**: GitHub Actions

---

## Phase 1: Fix Critical Blockers - DONE

### 1A. Nunito font
- Downloaded variable weight TTF from Google Fonts GitHub
- Registered in pubspec.yaml under `fonts:` section

### 1B. Drift web database
- Switched from WASM approach (requires external files) to `WebDatabase` (IndexedDB)
- Works out of the box, no external file hosting needed

### 1C. Remove unused dependency
- `flutter_screenutil` removed

---

## Phase 2: Audio Assets & Integration - DONE

### 2A. Sound effects
- Generated 12 WAV files with Python synthesizer script
- Total size ~360KB

### 2B. Integration points
- `main.dart` → `SoundManager().init()` at startup
- `AnimatedChessboard._handleMove()` → `playMoveSound(isCapture, isCheck)`
- `FeedbackOverlay.initState()` → `playSuccess()` / `playError()` based on type
- `StarResultDialog` star animation → `playStar()` per star
- `SettingsScreen` toggles → `setSoundEnabled()` / `setMusicEnabled()`

---

## Phase 3: App Branding - DONE

### Display names
- Android: `android:label="Chess Quest"` + INTERNET permission
- Web: title, description, theme-color (#6C63FF), manifest name/categories
- iOS: already correct

### App icons
- Generated with `flutter_launcher_icons` from Gemini-created 1024x1024 PNG
- All platform sizes auto-generated

### PWA
- manifest.json updated with categories ["games", "education"], proper theme/background colors

---

## Phase 4: Store Signing & Build Config - DONE

### Android
- build.gradle.kts loads `key.properties` if present, falls back to debug signing
- `minSdk = 21`, `key.properties.example` template created

### .gitignore
- Added: `android/key.properties`, `*.jks`, `*.keystore`, `.env`

---

## Phase 5: Expand Puzzles - DEFERRED
- Plan was to import from Lichess CSV with a Dart script
- Currently at 125 puzzles, target was 500
- Script `tool/import_puzzles.dart` not yet created

---

## Phase 6: Core Logic Tests - DONE (38 tests)

### Test files created:
1. `test/engine/dart_minimax_engine_test.dart` (7 tests)
   - Valid algebraic notation, mate-in-1 detection, evaluation signs, randomness, depth
2. `test/gamification/rank_test.dart` (11 tests)
   - XP boundaries, progressToNext, nextRank, ordering invariants
3. `test/curriculum/lesson_controller_test.dart` (11 tests)
   - Step advancement, move/quiz handling, hints, star calculation
4. `test/puzzles/puzzle_controller_test.dart` (6 tests)
   - Solve detection, attempts, failure, reset, theme loading
5. `test/widget_test.dart` (1 test)
   - Placeholder (full app test requires integration tests due to async DB)

### Bug fixed during testing:
- Engine used manual 0-63 board indexing but bishop uses 0x88. Fixed to use `boardSize.squareName()`.

---

## Phase 7: GitHub Actions CI/CD - DONE

### Pipeline (`.github/workflows/ci.yml`):
- Trigger: push to main, pull requests
- Jobs: analyze → test → build-web + build-android (parallel after tests pass)

---

## Phase 8: Documentation - DONE

- README rewritten with features, tech stack, setup instructions, architecture
- PRIVACY_POLICY.md created (COPPA compliant, no data collection)
- analysis_options.yaml hardened (avoid_print, sort_child_properties_last, etc.)
- .gitignore audited for sensitive files

---

## Verification Results
1. `flutter analyze` — 0 issues
2. `flutter test` — 38/38 passing
3. `flutter build web` — successful
4. App icons — generated for all platforms
