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

  // World 1: The Awakening
  static List<Chapter> get world1Chapters => [
        Chapter(
          id: 'ch1',
          title: 'Into the Board',
          description: 'Fall into a magical world of living chess pieces!',
          icon: '✨',
          worldIndex: 0,
          xpReward: 30,
          lessons: [
            Lesson(id: 'ch1_l1', title: 'The Magic Board', description: 'Where am I?', steps: []),
            Lesson(id: 'ch1_l2', title: 'The Lost Pawns', description: 'Rescue the trapped pawns!', steps: []),
            Lesson(id: 'ch1_l3', title: "The Brave Pawn's Journey", description: 'Help a pawn reach the other side!', steps: []),
          ],
        ),
        Chapter(
          id: 'ch2',
          title: 'The Castle Towers',
          description: 'Break the walls and free the villagers!',
          icon: '🏰',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(id: 'ch2_l1', title: 'Breaking the Walls', description: 'The rook smashes through!', steps: []),
            Lesson(id: 'ch2_l2', title: 'Rook Rescue Mission', description: 'Save everyone!', steps: []),
            Lesson(id: 'ch2_l3', title: 'Tower Defense', description: 'Rook vs rook showdown!', steps: []),
          ],
        ),
        Chapter(
          id: 'ch3',
          title: 'The Diagonal Forest',
          description: 'Find the mysterious Bishop in the woods!',
          icon: '🌲',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(id: 'ch3_l1', title: 'The Forest Path', description: 'Follow the diagonal trails!', steps: []),
            Lesson(id: 'ch3_l2', title: 'Treasure Hunt', description: 'Collect the forest treasures!', steps: []),
            Lesson(id: 'ch3_l3', title: 'Light and Shadow', description: 'Two bishops, two colors!', steps: []),
          ],
        ),
        Chapter(
          id: 'ch4',
          title: 'Her Majesty',
          description: 'Rescue the powerful Queen from the Shadow!',
          icon: '👑',
          worldIndex: 0,
          xpReward: 40,
          lessons: [
            Lesson(id: 'ch4_l1', title: 'The Captured Queen', description: 'Free the most powerful piece!', steps: []),
            Lesson(id: 'ch4_l2', title: "The Queen's Wrath", description: 'She goes everywhere!', steps: []),
            Lesson(id: 'ch4_l3', title: 'Royal Rampage', description: 'Nothing can stop her!', steps: []),
          ],
        ),
        Chapter(
          id: 'ch5',
          title: "Sir Hops' Training",
          description: "Learn the knight's secret L-shape jump!",
          icon: '🐴',
          worldIndex: 0,
          xpReward: 50,
          lessons: [
            Lesson(id: 'ch5_l1', title: 'The L-Shape Secret', description: "Sir Hops reveals his power!", steps: []),
            Lesson(id: 'ch5_l2', title: 'Jump Over Everything', description: "The knight's superpower!", steps: []),
            Lesson(id: 'ch5_l3', title: 'The Knight Trail', description: 'Navigate the obstacle course!', steps: []),
            Lesson(id: 'ch5_l4', title: 'Double Trouble', description: 'Attack two at once!', steps: []),
          ],
        ),
        Chapter(
          id: 'ch6',
          title: 'Protecting the King',
          description: 'The most important piece must survive!',
          icon: '🛡️',
          worldIndex: 0,
          xpReward: 50,
          lessons: [
            Lesson(id: 'ch6_l1', title: 'The Careful King', description: 'One step at a time!', steps: []),
            Lesson(id: 'ch6_l2', title: 'Danger! Check!', description: 'The king is under attack!', steps: []),
            Lesson(id: 'ch6_l3', title: 'No Escape: Checkmate', description: 'Game over for the enemy!', steps: []),
          ],
        ),
        Chapter(
          id: 'ch7',
          title: 'The First Battle',
          description: 'Assemble your army and fight!',
          icon: '⚔️',
          worldIndex: 0,
          xpReward: 50,
          lessons: [
            Lesson(id: 'ch7_l1', title: 'Battle Formation', description: 'Place your army!', steps: []),
            Lesson(id: 'ch7_l2', title: 'Know Your Worth', description: 'Not all pieces are equal!', steps: []),
            Lesson(id: 'ch7_l3', title: 'Into Battle!', description: 'Your first real game!', steps: []),
          ],
        ),
      ];

  // World 2: The Gathering
  static List<Chapter> get world2Chapters => [
        Chapter(id: 'ch8', title: 'The Secret Passages', description: 'Castling and hidden moves!', icon: '🚪', worldIndex: 1, xpReward: 40,
          lessons: [
            Lesson(id: 'ch8_l1', title: 'The Castle Swap', description: 'King and rook team up!', steps: []),
            Lesson(id: 'ch8_l2', title: 'The Sneaky Capture', description: 'En passant — the ghost move!', steps: []),
            Lesson(id: 'ch8_l3', title: 'The Transformation', description: 'Pawns become queens!', steps: []),
          ]),
        Chapter(id: 'ch9', title: 'The Shadow Trap', description: "Don't fall into stalemate!", icon: '🕸️', worldIndex: 1, xpReward: 40,
          lessons: [
            Lesson(id: 'ch9_l1', title: 'Nobody Wins', description: 'The stalemate trap!', steps: []),
            Lesson(id: 'ch9_l2', title: "Don't Let Them Escape", description: 'Avoid the draw!', steps: []),
          ]),
        Chapter(id: 'ch10', title: 'The Checkmate Scrolls', description: 'Ancient patterns of victory!', icon: '📜', worldIndex: 1, xpReward: 50,
          lessons: [
            Lesson(id: 'ch10_l1', title: 'The Back Rank Ambush', description: 'Trapped by their own army!', steps: []),
            Lesson(id: 'ch10_l2', title: "The Scholar's Trick", description: 'A 4-move surprise!', steps: []),
            Lesson(id: 'ch10_l3', title: 'The Smothered Strike', description: "Sir Hops' ultimate move!", steps: []),
          ]),
        Chapter(id: 'ch11', title: 'Battle Formations', description: 'Opening the right way!', icon: '🚀', worldIndex: 1, xpReward: 50,
          lessons: [
            Lesson(id: 'ch11_l1', title: 'Seize the Center', description: 'Control the heart of the board!', steps: []),
            Lesson(id: 'ch11_l2', title: 'Deploy Your Forces', description: 'Get everyone into battle!', steps: []),
            Lesson(id: 'ch11_l3', title: 'Shield the King', description: 'Castle early!', steps: []),
            Lesson(id: 'ch11_l4', title: 'Famous Formations', description: 'Openings the masters use!', steps: []),
          ]),
        Chapter(id: 'ch12', title: 'The Spy Network', description: 'Check from every angle!', icon: '🔍', worldIndex: 1, xpReward: 50,
          lessons: [
            Lesson(id: 'ch12_l1', title: 'Find the Check', description: 'Spot the attack!', steps: []),
            Lesson(id: 'ch12_l2', title: 'Escape the Trap', description: 'Three ways to survive!', steps: []),
            Lesson(id: 'ch12_l3', title: 'Deliver the Blow', description: 'Checkmate in one move!', steps: []),
          ]),
        Chapter(id: 'ch13', title: 'The Proving Ground', description: 'Test everything you know!', icon: '🏟️', worldIndex: 1, xpReward: 40,
          lessons: [
            Lesson(id: 'ch13_l1', title: 'The Challenge', description: 'Mixed puzzles!', steps: []),
            Lesson(id: 'ch13_l2', title: 'Ready for War', description: 'Prove yourself!', steps: []),
          ]),
      ];

  // World 3: The Training Grounds
  static List<Chapter> get world3Chapters => [
        Chapter(id: 'ch14', title: 'The Fork Strike', description: "Attack two at once!", icon: '🍴', worldIndex: 2, xpReward: 50,
          lessons: [
            Lesson(id: 'ch14_l1', title: 'Double Threat', description: "One move, two targets!", steps: []),
            Lesson(id: 'ch14_l2', title: "Sir Hops' Fork Mastery", description: "The knight is the fork king!", steps: []),
            Lesson(id: 'ch14_l3', title: 'Everyone Can Fork', description: 'Pawns, bishops, queens too!', steps: []),
          ]),
        Chapter(id: 'ch15', title: 'The Pin and Skewer', description: 'Pieces that cannot move!', icon: '📌', worldIndex: 2, xpReward: 50,
          lessons: [
            Lesson(id: 'ch15_l1', title: 'Pinned Down', description: "Stuck in place!", steps: []),
            Lesson(id: 'ch15_l2', title: 'Pin Puzzles', description: 'Find and exploit the pin!', steps: []),
            Lesson(id: 'ch15_l3', title: 'The Skewer', description: 'Attack through a piece!', steps: []),
          ]),
        Chapter(id: 'ch16', title: 'The Hidden Attack', description: 'Surprise! Two threats at once!', icon: '🎭', worldIndex: 2, xpReward: 50,
          lessons: [
            Lesson(id: 'ch16_l1', title: 'The Ambush', description: 'Move one, reveal another!', steps: []),
            Lesson(id: 'ch16_l2', title: 'Double Check!', description: 'The most powerful attack!', steps: []),
          ]),
        Chapter(id: 'ch17', title: 'Shadow Tactics', description: 'Deflection, decoy & trickery!', icon: '🧠', worldIndex: 2, xpReward: 50,
          lessons: [
            Lesson(id: 'ch17_l1', title: 'Lure the Guard', description: 'Pull defenders away!', steps: []),
            Lesson(id: 'ch17_l2', title: 'Too Many Jobs', description: 'Overloaded pieces crumble!', steps: []),
            Lesson(id: 'ch17_l3', title: 'Tactics Arena', description: 'Test all your tricks!', steps: []),
          ]),
        Chapter(id: 'ch18', title: 'Victory Patterns', description: 'Learn to deliver the final blow!', icon: '💡', worldIndex: 2, xpReward: 50,
          lessons: [
            Lesson(id: 'ch18_l1', title: 'The Back Rank Trap', description: 'Their own army betrays them!', steps: []),
            Lesson(id: 'ch18_l2', title: "The Scholar's Gambit", description: 'Attack and defend!', steps: []),
            Lesson(id: 'ch18_l3', title: "Sir Hops' Smothered Mate", description: 'The ultimate knight move!', steps: []),
            Lesson(id: 'ch18_l4', title: 'Pattern Flash', description: 'Name that checkmate!', steps: []),
          ]),
        Chapter(id: 'ch19', title: 'War Council', description: 'Plan your opening strategy!', icon: '🗺️', worldIndex: 2, xpReward: 50,
          lessons: [
            Lesson(id: 'ch19_l1', title: 'Control the Center', description: 'The most important territory!', steps: []),
            Lesson(id: 'ch19_l2', title: 'Deploy Your Forces', description: 'Get everyone fighting!', steps: []),
            Lesson(id: 'ch19_l3', title: 'Shield Your King', description: 'Castle before attacking!', steps: []),
            Lesson(id: 'ch19_l4', title: 'Battle Plans', description: 'Famous opening strategies!', steps: []),
          ]),
      ];

  // World 4: The Campaign
  static List<Chapter> get world4Chapters => [
        Chapter(id: 'ch20', title: 'The Pawn Wall', description: "Your army's skeleton!", icon: '🏗️', worldIndex: 3, xpReward: 50,
          lessons: [
            Lesson(id: 'ch20_l1', title: 'Strong and Weak', description: 'Some pawns need protection!', steps: []),
            Lesson(id: 'ch20_l2', title: 'The Chain', description: 'Attack the base!', steps: []),
          ]),
        Chapter(id: 'ch21', title: "Wake Your Army", description: 'Active pieces win wars!', icon: '⚡', worldIndex: 3, xpReward: 50,
          lessons: [
            Lesson(id: 'ch21_l1', title: 'Good vs Bad Bishops', description: 'Is your bishop trapped?', steps: []),
            Lesson(id: 'ch21_l2', title: "The Knight's Outpost", description: 'An unshakeable position!', steps: []),
            Lesson(id: 'ch21_l3', title: 'Open the Roads', description: 'Rooks need highways!', steps: []),
          ]),
        Chapter(id: 'ch22', title: "The King's Shield", description: 'Protect your ruler!', icon: '🛡️', worldIndex: 3, xpReward: 50,
          lessons: [
            Lesson(id: 'ch22_l1', title: 'The Pawn Shield', description: "Don't weaken it!", steps: []),
            Lesson(id: 'ch22_l2', title: 'Storm the Castle', description: 'Attack the enemy king!', steps: []),
          ]),
        Chapter(id: 'ch23', title: 'The Endgame', description: 'Finish what you started!', icon: '🏁', worldIndex: 3, xpReward: 50,
          lessons: [
            Lesson(id: 'ch23_l1', title: 'Queen vs Lone King', description: 'Drive him to the corner!', steps: []),
            Lesson(id: 'ch23_l2', title: 'Rook vs Lone King', description: 'The box technique!', steps: []),
            Lesson(id: 'ch23_l3', title: 'The King Race', description: 'Opposition is everything!', steps: []),
            Lesson(id: 'ch23_l4', title: 'Can You Catch It?', description: 'The square rule!', steps: []),
          ]),
      ];

  // World 5: The Final Battle
  static List<Chapter> get world5Chapters => [
        Chapter(id: 'ch24', title: 'Ancient Techniques', description: 'Endgame secrets of the masters!', icon: '🎓', worldIndex: 4, xpReward: 50,
          lessons: [
            Lesson(id: 'ch24_l1', title: 'The Bridge', description: 'Lucena and Philidor!', steps: []),
            Lesson(id: 'ch24_l2', title: 'Opposite Worlds', description: 'Bishop color matters!', steps: []),
          ]),
        Chapter(id: 'ch25', title: "The Shadow King's Mind", description: "Think like your enemy!", icon: '🔮', worldIndex: 4, xpReward: 50,
          lessons: [
            Lesson(id: 'ch25_l1', title: "Stop His Plan", description: 'Prophylaxis!', steps: []),
            Lesson(id: 'ch25_l2', title: 'Claim Territory', description: 'Space wins wars!', steps: []),
          ]),
        Chapter(id: 'ch26', title: 'The Inner Eye', description: 'See moves before they happen!', icon: '👁️', worldIndex: 4, xpReward: 50,
          lessons: [
            Lesson(id: 'ch26_l1', title: 'Blind Vision', description: 'Calculate in your head!', steps: []),
            Lesson(id: 'ch26_l2', title: 'Choose Your Weapon', description: 'Candidate moves!', steps: []),
          ]),
        Chapter(id: 'ch27', title: 'Battle Instinct', description: 'See patterns instantly!', icon: '⚡', worldIndex: 4, xpReward: 50,
          lessons: [
            Lesson(id: 'ch27_l1', title: 'Pattern Master', description: 'Spot it in a flash!', steps: []),
          ]),
        Chapter(id: 'ch28', title: 'Defeat the Shadow King', description: 'The final showdown!', icon: '🗡️', worldIndex: 4, xpReward: 50,
          lessons: [
            Lesson(id: 'ch28_l1', title: 'The Final Game', description: 'Everything has led to this!', steps: []),
          ]),
      ];
}
