import '../../domain/entities/lesson.dart';

/// Chapter 7: The King - one-square movement, danger zones.
class Chapter7Content {
  static List<Lesson> get lessons => [
        _theKing,
        _dangerZones,
        _kingWalk,
      ];

  static Lesson get _theKing => const Lesson(
        id: 'ch7_l1',
        title: 'The King',
        description: 'One careful step at a time',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "The King is the MOST important piece! If you lose the king, you lose the game!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4K3/8/8/8 w - - 0 1',
            message:
                "The king can move one square in any direction - forward, backward, sideways, or diagonally.",
            highlightSquares: ['d5', 'e5', 'f5', 'd4', 'f4', 'd3', 'e3', 'f3'],
          ),
          MascotSpeechStep(
            message:
                "He's slow but mighty! The whole game is about protecting YOUR king while attacking the enemy's!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4K3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd5'), ('e4', 'e5'), ('e4', 'f5'),
              ('e4', 'd4'), ('e4', 'f4'),
              ('e4', 'd3'), ('e4', 'e3'), ('e4', 'f3'),
            ],
            hintMessage: 'Move the king one square in any direction!',
            successMessage: "The king takes one careful step!",
            showValidMoves: true,
          ),
          QuizStep(
            question: 'What happens if your king is captured?',
            options: [
              'Nothing special',
              'You lose a piece',
              'You lose the game!',
              'You get a new king',
            ],
            correctIndex: 2,
            explanation:
                "If your king is trapped (checkmate), you lose! That's why protecting the king is your #1 job!",
          ),
        ],
      );

  static Lesson get _dangerZones => const Lesson(
        id: 'ch7_l2',
        title: 'Danger Zones',
        description: "The king can't go everywhere!",
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "The king has a rule: it can NEVER move to a square where it would be attacked! Those are danger zones!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4K3/8/2r5/8 w - - 0 1',
            message:
                "The black rook controls the entire c-file. The king can't go to any square the rook attacks!",
            dangerSquares: ['c3', 'c4', 'c5'],
            arrows: [('c2', 'c8')],
          ),
          ShowPositionStep(
            fen: '8/8/8/3k4/8/8/8/4K3 w - - 0 1',
            message:
                "Kings also can't stand next to each other! There must always be at least one square between them.",
            dangerSquares: ['c5', 'd5', 'e5', 'c4', 'e4'],
          ),
          QuizStep(
            question: 'Can the king move to a square attacked by an enemy piece?',
            options: ['Yes', 'No, never!'],
            correctIndex: 1,
            explanation:
                "Never! The king must always move to a safe square. Walking into danger is not allowed!",
          ),
          MascotSpeechStep(
            message:
                "Remember: the king is brave but careful. Always check for danger before moving!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _kingWalk => const Lesson(
        id: 'ch7_l3',
        title: 'King Walk',
        description: 'Navigate through danger!',
        xpReward: 30,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message:
                "Can you guide the king safely from one side of the board to the other? Watch out for enemy pieces!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "Avoid the squares attacked by enemy pieces - those are shown in red!",
            emotion: 'explaining',
          ),
          FreePlayStep(
            fen: '8/8/8/8/r7/8/8/4K3 w - - 0 1',
            message: 'Guide the king to the right side! Avoid the rook!',
          ),
        ],
      );
}
