# Chess Quest

An interactive chess learning app for kids ages 5+, built with Flutter. Teaches chess from absolute beginner to master level through hands-on, gamified lessons.

## Features

- **28 chapters** across 5 worlds, progressing from "what is a chessboard" to master-level strategy
- **Interactive lessons** with guided board exercises, quizzes, and mini-games
- **125+ tactical puzzles** (forks, pins, skewers, mates, discovered attacks)
- **Play vs AI** with 6 difficulty levels (Pawn to King)
- **Gamification** - XP, 9 ranks (Pawn Apprentice to Grandmaster), achievements, daily streaks, coin shop
- **Parent dashboard** with progress tracking and skill charts
- **Fully offline** - no internet required
- **Cross-platform** - Web, Android, iOS

## Tech Stack

| Component | Technology |
|-----------|-----------|
| Framework | Flutter (Dart) |
| Chess logic | `bishop` package |
| Board UI | `squares` + `square_bishop` |
| State management | `flutter_riverpod` |
| Database | `drift` (SQLite) |
| Routing | `go_router` |
| AI engine | Custom Dart minimax (web), Stockfish FFI (mobile planned) |
| Audio | `just_audio` |

## Getting Started

### Prerequisites
- Flutter 3.41+ (stable channel)
- Dart 3.11+

### Setup
```bash
# Clone and enter the project
git clone <repo-url>
cd chess

# Install dependencies
flutter pub get

# Generate Drift database code
dart run build_runner build --delete-conflicting-outputs

# Run on web
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS (requires Mac)
flutter run -d ios
```

### Android Release Build
1. Generate a keystore:
   ```bash
   keytool -genkey -v -keystore chess-quest-release.jks -keyalg RSA -keysize 2048 -validity 10000 -alias chess-quest
   ```
2. Copy `android/key.properties.example` to `android/key.properties` and fill in your keystore details
3. Build: `flutter build apk --release`

## Architecture

Feature-first clean architecture with Riverpod:

```
lib/
  core/           # Shared constants, widgets, providers, router, utils
  features/
    auth/         # Profile creation/selection
    curriculum/   # Lessons, chapters, worlds, progress tracking
    play/         # Play vs AI
    puzzles/      # Tactical puzzle trainer
    gamification/ # XP, ranks, achievements, streaks
    engine/       # AI engine abstraction
    shop/         # Cosmetic unlockables
    parent_dashboard/  # Progress charts for parents
    settings/     # App preferences
  database/       # Drift tables, DAOs, connections
```

## Running Tests

```bash
flutter test
```

## Privacy

Chess Quest collects no personal data. All data is stored locally on the device. See [PRIVACY_POLICY.md](PRIVACY_POLICY.md) for details.

## License

All rights reserved.
