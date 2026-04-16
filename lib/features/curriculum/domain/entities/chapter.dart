import 'lesson.dart';

class Chapter {
  final String id;
  final String title;
  final String description;
  final String icon;
  final int worldIndex;
  final List<Lesson> lessons;
  final int xpReward;

  const Chapter({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.worldIndex,
    required this.lessons,
    this.xpReward = 50,
  });

  // World 1: The Kingdom
  static List<Chapter> get world1Chapters => [
        Chapter(
          id: 'ch1',
          title: 'The Chessboard',
          description: 'Explore the battlefield where chess happens!',
          icon: '🏰',
          worldIndex: 0,
          xpReward: 30,
          lessons: [
            Lesson(
              id: 'ch1_l1',
              title: 'The Battlefield',
              description: 'Discover the 64 squares',
              steps: [],
            ),
            Lesson(
              id: 'ch1_l2',
              title: 'Ranks and Files',
              description: 'Learn the rows and columns',
              steps: [],
            ),
            Lesson(
              id: 'ch1_l3',
              title: 'Light and Dark',
              description: 'The two colors of the board',
              steps: [],
            ),
          ],
        ),
        Chapter(
          id: 'ch2',
          title: 'The Pawns',
          description: 'Meet the brave little soldiers!',
          icon: '♟',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(
              id: 'ch2_l1',
              title: 'The Brave Soldiers',
              description: 'How pawns move forward',
              steps: [],
            ),
            Lesson(
              id: 'ch2_l2',
              title: 'The First Charge',
              description: 'The two-square opening move',
              steps: [],
            ),
            Lesson(
              id: 'ch2_l3',
              title: 'Capturing Diagonally',
              description: 'How pawns capture enemies',
              steps: [],
            ),
            Lesson(
              id: 'ch2_l4',
              title: 'Pawn Maze',
              description: 'Navigate through the maze!',
              steps: [],
              isMiniGame: true,
            ),
          ],
        ),
        Chapter(
          id: 'ch3',
          title: 'The Rook',
          description: 'The powerful castle tower!',
          icon: '♜',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(
              id: 'ch3_l1',
              title: 'The Castle Tower',
              description: 'Rooks move in straight lines',
              steps: [],
            ),
            Lesson(
              id: 'ch3_l2',
              title: 'Rook Capture Mission',
              description: 'Capture all the targets!',
              steps: [],
            ),
            Lesson(
              id: 'ch3_l3',
              title: 'Rook vs Rook',
              description: 'Your first piece battle!',
              steps: [],
            ),
          ],
        ),
        Chapter(
          id: 'ch4',
          title: 'The Bishop',
          description: 'The diagonal runner!',
          icon: '♝',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(
              id: 'ch4_l1',
              title: 'The Diagonal Runner',
              description: 'Bishops slide diagonally',
              steps: [],
            ),
            Lesson(
              id: 'ch4_l2',
              title: 'Bishop Capture Mission',
              description: 'Capture targets diagonally!',
              steps: [],
            ),
            Lesson(
              id: 'ch4_l3',
              title: 'Two Bishops Team Up',
              description: 'Together they cover everything!',
              steps: [],
            ),
          ],
        ),
        Chapter(
          id: 'ch5',
          title: 'The Queen',
          description: 'The mightiest piece!',
          icon: '♛',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(
              id: 'ch5_l1',
              title: 'The Mighty Queen',
              description: 'She moves like rook AND bishop!',
              steps: [],
            ),
            Lesson(
              id: 'ch5_l2',
              title: 'Queen Domination',
              description: 'Cover as many squares as you can!',
              steps: [],
              isMiniGame: true,
            ),
            Lesson(
              id: 'ch5_l3',
              title: "The Queen's Mission",
              description: 'Capture all targets efficiently!',
              steps: [],
            ),
          ],
        ),
        Chapter(
          id: 'ch6',
          title: 'The Knight',
          description: 'The tricky L-shape jumper!',
          icon: '♞',
          worldIndex: 0,
          xpReward: 50,
          lessons: [
            Lesson(
              id: 'ch6_l1',
              title: "Sir Hops' Secret",
              description: 'The mysterious L-shape move!',
              steps: [],
            ),
            Lesson(
              id: 'ch6_l2',
              title: 'Jumping Over Walls',
              description: 'Knights can jump!',
              steps: [],
            ),
            Lesson(
              id: 'ch6_l3',
              title: "Knight's Tour",
              description: 'Visit all the target squares!',
              steps: [],
              isMiniGame: true,
            ),
            Lesson(
              id: 'ch6_l4',
              title: 'Knight Fork Preview',
              description: 'Attack two at once!',
              steps: [],
            ),
          ],
        ),
        Chapter(
          id: 'ch7',
          title: 'The King',
          description: 'Protect the most important piece!',
          icon: '♚',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(
              id: 'ch7_l1',
              title: 'The King',
              description: 'One careful step at a time',
              steps: [],
            ),
            Lesson(
              id: 'ch7_l2',
              title: 'Danger Zones',
              description: "The king can't go everywhere!",
              steps: [],
            ),
            Lesson(
              id: 'ch7_l3',
              title: 'King Walk',
              description: 'Navigate through danger!',
              steps: [],
              isMiniGame: true,
            ),
          ],
        ),
      ];

  // World 2: Rules of Battle
  static List<Chapter> get world2Chapters => [
        Chapter(
          id: 'ch8',
          title: 'Board Setup',
          description: 'Place every piece in its home!',
          icon: '🎯',
          worldIndex: 1,
          xpReward: 30,
          lessons: [
            Lesson(
                id: 'ch8_l1',
                title: 'Where Does Everyone Go?',
                description: 'Drag pieces to their starting squares',
                steps: []),
            Lesson(
                id: 'ch8_l2',
                title: 'Speed Setup',
                description: 'How fast can you set up the board?',
                steps: [],
                isMiniGame: true),
          ],
        ),
        Chapter(
          id: 'ch9',
          title: 'Check',
          description: 'The king is in danger!',
          icon: '⚠️',
          worldIndex: 1,
          xpReward: 50,
          lessons: [
            Lesson(
                id: 'ch9_l1',
                title: 'The King is in Danger!',
                description: 'What happens when a piece attacks the king',
                steps: []),
            Lesson(
                id: 'ch9_l2',
                title: 'Find the Check',
                description: 'Which move gives check?',
                steps: []),
            Lesson(
                id: 'ch9_l3',
                title: 'Escape the Check',
                description: 'Three ways to save the king!',
                steps: []),
          ],
        ),
        Chapter(
          id: 'ch10',
          title: 'Checkmate',
          description: 'Game over!',
          icon: '🏆',
          worldIndex: 1,
          xpReward: 50,
          lessons: [
            Lesson(
                id: 'ch10_l1',
                title: 'Game Over!',
                description: 'When there is no escape',
                steps: []),
            Lesson(
                id: 'ch10_l2',
                title: 'Checkmate in 1',
                description: 'Find the winning move!',
                steps: []),
            Lesson(
                id: 'ch10_l3',
                title: 'Is it Checkmate?',
                description: 'Check, checkmate, or neither?',
                steps: []),
          ],
        ),
        Chapter(
          id: 'ch11',
          title: 'Stalemate & Draws',
          description: 'Nobody wins!',
          icon: '🤝',
          worldIndex: 1,
          xpReward: 40,
          lessons: [
            Lesson(
                id: 'ch11_l1',
                title: 'Nobody Wins',
                description: 'When no moves are legal',
                steps: []),
            Lesson(
                id: 'ch11_l2',
                title: 'Avoid the Stalemate',
                description: "Don't let them escape!",
                steps: []),
          ],
        ),
        Chapter(
          id: 'ch12',
          title: 'Special Moves',
          description: 'Secret chess superpowers!',
          icon: '✨',
          worldIndex: 1,
          xpReward: 50,
          lessons: [
            Lesson(
                id: 'ch12_l1',
                title: 'Castling',
                description: 'King and rook team up!',
                steps: []),
            Lesson(
                id: 'ch12_l2',
                title: 'En Passant',
                description: 'The sneaky pawn capture!',
                steps: []),
            Lesson(
                id: 'ch12_l3',
                title: 'Pawn Promotion',
                description: 'The pawn becomes a queen!',
                steps: []),
          ],
        ),
        Chapter(
          id: 'ch13',
          title: 'Piece Values',
          description: 'Who is worth more?',
          icon: '⚖️',
          worldIndex: 1,
          xpReward: 40,
          lessons: [
            Lesson(
                id: 'ch13_l1',
                title: "Who's Worth More?",
                description: 'The value of each piece',
                steps: []),
            Lesson(
                id: 'ch13_l2',
                title: 'Good Trades & Bad Trades',
                description: 'Should you capture?',
                steps: []),
          ],
        ),
      ];

  // World 3: The Strategist
  static List<Chapter> get world3Chapters => [
        Chapter(
            id: 'ch14',
            title: 'Opening Principles',
            description: 'Start the game strong!',
            icon: '🚀',
            worldIndex: 2,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch14_l1',
                  title: 'Control the Center',
                  description: 'The most important squares',
                  steps: []),
              Lesson(
                  id: 'ch14_l2',
                  title: 'Develop Your Pieces',
                  description: 'Get your army into battle!',
                  steps: []),
              Lesson(
                  id: 'ch14_l3',
                  title: 'Castle Early!',
                  description: 'Protect your king quickly',
                  steps: []),
              Lesson(
                  id: 'ch14_l4',
                  title: 'Opening Explorer',
                  description: 'Famous openings to try',
                  steps: []),
            ]),
        Chapter(
            id: 'ch15',
            title: 'Forks',
            description: 'Attack two at once!',
            icon: '🍴',
            worldIndex: 2,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch15_l1',
                  title: 'Attack Two at Once',
                  description: 'The power of the fork!',
                  steps: []),
              Lesson(
                  id: 'ch15_l2',
                  title: 'Knight Forks',
                  description: 'The knight is the fork master!',
                  steps: []),
              Lesson(
                  id: 'ch15_l3',
                  title: 'Other Forks',
                  description: 'Any piece can fork!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch16',
            title: 'Pins & Skewers',
            description: 'Pieces stuck in place!',
            icon: '📌',
            worldIndex: 2,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch16_l1',
                  title: 'The Pin',
                  description: "A piece that can't move!",
                  steps: []),
              Lesson(
                  id: 'ch16_l2',
                  title: 'Pin Puzzles',
                  description: 'Find and use the pin!',
                  steps: []),
              Lesson(
                  id: 'ch16_l3',
                  title: 'The Skewer',
                  description: 'Attack through a piece!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch17',
            title: 'Discovered Attacks',
            description: 'The hidden attacker!',
            icon: '🎭',
            worldIndex: 2,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch17_l1',
                  title: 'The Hidden Attacker',
                  description: 'Move one, reveal another!',
                  steps: []),
              Lesson(
                  id: 'ch17_l2',
                  title: 'Double Check',
                  description: 'Two attackers at once!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch18',
            title: 'Advanced Tactics',
            description: 'Deflection, decoy & more!',
            icon: '🧠',
            worldIndex: 2,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch18_l1',
                  title: 'Lure Them Away',
                  description: 'Deflection and decoy tricks!',
                  steps: []),
              Lesson(
                  id: 'ch18_l2',
                  title: 'Too Many Jobs',
                  description: 'Overloaded pieces break down!',
                  steps: []),
              Lesson(
                  id: 'ch18_l3',
                  title: 'Mixed Tactics Trainer',
                  description: 'Test all your tactics!',
                  steps: [],
                  isMiniGame: true),
            ]),
        Chapter(
            id: 'ch19',
            title: 'Checkmate Patterns',
            description: 'Recognize the winning patterns!',
            icon: '💡',
            worldIndex: 2,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch19_l1',
                  title: 'Back Rank Mate',
                  description: 'Trapped on the back row!',
                  steps: []),
              Lesson(
                  id: 'ch19_l2',
                  title: "Scholar's Mate",
                  description: 'The famous 4-move trap!',
                  steps: []),
              Lesson(
                  id: 'ch19_l3',
                  title: 'Smothered Mate',
                  description: 'The knight strikes!',
                  steps: []),
              Lesson(
                  id: 'ch19_l4',
                  title: 'Pattern Drill',
                  description: 'Name that pattern!',
                  steps: [],
                  isMiniGame: true),
            ]),
      ];

  // World 4: Grandmaster's Path
  static List<Chapter> get world4Chapters => [
        Chapter(
            id: 'ch20',
            title: 'Pawn Structure',
            description: 'The skeleton of your position!',
            icon: '🏗️',
            worldIndex: 3,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch20_l1',
                  title: 'Strong & Weak Pawns',
                  description: 'Isolated, doubled, backward',
                  steps: []),
              Lesson(
                  id: 'ch20_l2',
                  title: 'Pawn Chains',
                  description: 'Attack the base!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch21',
            title: 'Piece Activity',
            description: 'Active pieces win games!',
            icon: '⚡',
            worldIndex: 3,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch21_l1',
                  title: 'Good vs Bad Bishops',
                  description: 'Is your bishop blocked?',
                  steps: []),
              Lesson(
                  id: 'ch21_l2',
                  title: 'Knight Outposts',
                  description: 'A knight that cannot be chased!',
                  steps: []),
              Lesson(
                  id: 'ch21_l3',
                  title: 'Rooks on Open Files',
                  description: 'Give your rooks room!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch22',
            title: 'King Safety',
            description: 'Protect your king at all costs!',
            icon: '🛡️',
            worldIndex: 3,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch22_l1',
                  title: 'Pawn Shield',
                  description: 'Pawns protect the king',
                  steps: []),
              Lesson(
                  id: 'ch22_l2',
                  title: 'Attacking the King',
                  description: 'Build a powerful attack!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch23',
            title: 'Endgame Fundamentals',
            description: 'Finish the game strong!',
            icon: '🏁',
            worldIndex: 3,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch23_l1',
                  title: 'King & Queen vs King',
                  description: 'The basic checkmate',
                  steps: []),
              Lesson(
                  id: 'ch23_l2',
                  title: 'King & Rook vs King',
                  description: 'The box technique',
                  steps: []),
              Lesson(
                  id: 'ch23_l3',
                  title: 'King & Pawn Endgames',
                  description: 'Opposition is key!',
                  steps: []),
              Lesson(
                  id: 'ch23_l4',
                  title: 'The Square Rule',
                  description: 'Can the king catch the pawn?',
                  steps: []),
            ]),
      ];

  // World 5: Master's Domain
  static List<Chapter> get world5Chapters => [
        Chapter(
            id: 'ch24',
            title: 'Complex Endgames',
            description: 'Lucena, Philidor, and more!',
            icon: '🎓',
            worldIndex: 4,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch24_l1',
                  title: 'Rook Endgames',
                  description: 'The most common endgame',
                  steps: []),
              Lesson(
                  id: 'ch24_l2',
                  title: 'Bishop Endgames',
                  description: 'Same vs opposite color',
                  steps: []),
            ]),
        Chapter(
            id: 'ch25',
            title: 'Positional Play',
            description: 'Think long-term!',
            icon: '🗺️',
            worldIndex: 4,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch25_l1',
                  title: 'Prophylaxis',
                  description: "Stop your opponent's plan!",
                  steps: []),
              Lesson(
                  id: 'ch25_l2',
                  title: 'Space Advantage',
                  description: 'Control more of the board!',
                  steps: []),
            ]),
        Chapter(
            id: 'ch26',
            title: 'Calculation',
            description: 'See ahead like a grandmaster!',
            icon: '🔮',
            worldIndex: 4,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch26_l1',
                  title: 'Blind Calculation',
                  description: 'Calculate without seeing!',
                  steps: []),
              Lesson(
                  id: 'ch26_l2',
                  title: 'Candidate Moves',
                  description: 'Find the best options',
                  steps: []),
            ]),
        Chapter(
            id: 'ch27',
            title: 'Pattern Recognition',
            description: 'See patterns instantly!',
            icon: '⚡',
            worldIndex: 4,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch27_l1',
                  title: 'Pattern Master',
                  description: '500+ tactical patterns!',
                  steps: [],
                  isMiniGame: true),
            ]),
        Chapter(
            id: 'ch28',
            title: 'Complete Games',
            description: 'Study the masters!',
            icon: '📖',
            worldIndex: 4,
            xpReward: 50,
            lessons: [
              Lesson(
                  id: 'ch28_l1',
                  title: 'Famous Games',
                  description: 'Guess the master move!',
                  steps: []),
            ]),
      ];
}
