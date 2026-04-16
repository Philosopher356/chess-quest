# Curriculum Structure

## 5 Worlds, 28 Chapters, 76 Lessons

All 28 chapters have full interactive lesson content implemented.

### World 1: "The Kingdom" (Absolute Beginner) - XP to unlock: 0
| Ch | Title | Lessons | Key Content |
|----|-------|---------|-------------|
| 1 | The Chessboard | 3 | Board discovery, coordinates (tap-the-square), light/dark squares |
| 2 | The Pawns | 4 | Forward movement, 2-square first move, diagonal capture, Pawn Maze mini-game |
| 3 | The Rook | 3 | Straight lines, can't jump, capture mission, rook vs rook |
| 4 | The Bishop | 3 | Diagonals, stays on one color, two bishops cover all, capture mission |
| 5 | The Queen | 3 | Rook + bishop combined, queen domination puzzle, capture mission |
| 6 | The Knight | 4 | L-shape, jumping over pieces, knight's tour, fork preview |
| 7 | The King | 3 | One-step movement, danger zones (red squares), King Walk maze |

### World 2: "Rules of Battle" (Beginner) - XP to unlock: 300
| Ch | Title | Lessons | Key Content |
|----|-------|---------|-------------|
| 8 | Board Setup | 2 | Drag pieces to starting position, "queen on her color", speed quiz |
| 9 | Check | 3 | 3 escape methods (move/block/capture), find-the-check, escape exercises |
| 10 | Checkmate | 3 | Check vs checkmate, mate-in-1 puzzles, identification quiz |
| 11 | Stalemate & Draws | 2 | Stalemate definition, avoid-the-stalemate puzzles |
| 12 | Special Moves | 3 | Castling rules, en passant (ghost pawn), promotion + underpromotion |
| 13 | Piece Values | 2 | Point values (1/3/3/5/9), good/bad trade evaluation |

### World 3: "The Strategist" (Intermediate) - XP to unlock: 1500
| Ch | Title | Lessons | Key Content |
|----|-------|---------|-------------|
| 14 | Opening Principles | 4 | Center control, development, castle early, Italian/Queen's Gambit/London |
| 15 | Forks | 3 | Knight forks, pawn/bishop/queen forks, 15 progressive puzzles |
| 16 | Pins & Skewers | 3 | Absolute vs relative pins, pin puzzles, skewer concept |
| 17 | Discovered Attacks | 2 | Hidden attacker, double check (king must move) |
| 18 | Advanced Tactics | 3 | Deflection/decoy, overloaded pieces, mixed tactics trainer |
| 19 | Checkmate Patterns | 4 | Back rank mate, Scholar's mate + defense, smothered mate, pattern drill |

### World 4: "Grandmaster's Path" (Advanced) - XP to unlock: 4000
| Ch | Title | Lessons | Key Content |
|----|-------|---------|-------------|
| 20 | Pawn Structure | 2 | Isolated/doubled/backward/passed pawns, pawn chains (attack the base) |
| 21 | Piece Activity | 3 | Good/bad bishops, knight outposts, rooks on open files |
| 22 | King Safety | 2 | Pawn shield, attack building (3+ pieces needed) |
| 23 | Endgame Fundamentals | 4 | K+Q vs K, K+R vs K (box technique), opposition, square rule |

### World 5: "Master's Domain" (Expert) - XP to unlock: 8000
| Ch | Title | Lessons | Key Content |
|----|-------|---------|-------------|
| 24 | Complex Endgames | 2 | Rook endgames (Lucena/Philidor), opposite-color bishops |
| 25 | Positional Play | 2 | Prophylaxis ("what does opponent want?"), space advantage |
| 26 | Calculation | 2 | Blind visualization, candidate moves (CCT: checks/captures/threats) |
| 27 | Pattern Recognition | 1 | Mixed tactical puzzles, spaced repetition concept |
| 28 | Complete Games | 1 | Opera Game study, guess-the-move format |

## Lesson Step Types (9 types)
Defined in `lib/features/curriculum/domain/entities/lesson.dart`:
1. `MascotSpeechStep` - Sir Hops talks (tap to advance)
2. `ShowPositionStep` - Board with highlights/arrows/message (tap to advance)
3. `WaitForMoveStep` - Player must make specific move(s) on the board
4. `WaitForTapStep` - Player must tap a specific square
5. `QuizStep` - Multiple choice question
6. `FreePlayStep` - Free exploration mode
7. `AnimateMoveStep` - Show a piece moving
8. `CaptureChallenge` - Capture all targets in minimum moves
9. `CoordinateQuiz` - Tap named squares quickly

## Content Registry
`lib/features/curriculum/data/lesson_content/content_registry.dart` maps chapter IDs to lesson lists.
Each chapter has its own file: `chapter1_chessboard.dart` through `chapter28_complete_games.dart`.
