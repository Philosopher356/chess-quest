import '../../domain/entities/lesson.dart';

/// Chapter 6: The Knight - L-shape movement, jumping.
class Chapter6Content {
  static List<Lesson> get lessons => [
        _sirHopsSecret,
        _jumpingOverWalls,
        _knightsTour,
        _knightForkPreview,
      ];

  static Lesson get _sirHopsSecret => const Lesson(
        id: 'ch6_l1',
        title: "Sir Hops' Secret",
        description: 'The mysterious L-shape move!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Now it's time to reveal MY secret! I'm a knight, and I move in a special L-shape!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4N3/8/8/8 w - - 0 1',
            message:
                "The knight moves in an L-shape: two squares in one direction, then one square to the side!",
            highlightSquares: ['d6', 'f6', 'c5', 'g5', 'c3', 'g3', 'd2', 'f2'],
            arrows: [('e4', 'd6'), ('e4', 'f6'), ('e4', 'g5'), ('e4', 'g3')],
          ),
          MascotSpeechStep(
            message:
                "Think of it as: 2 squares straight + 1 square sideways, or 1 square straight + 2 squares sideways. Always makes an L!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4N3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd6'), ('e4', 'f6'),
              ('e4', 'c5'), ('e4', 'g5'),
              ('e4', 'c3'), ('e4', 'g3'),
              ('e4', 'd2'), ('e4', 'f2'),
            ],
            hintMessage: 'Move the knight in an L-shape to any highlighted square!',
            successMessage: "That's the L-shape! You did it!",
            showValidMoves: true,
          ),
          QuizStep(
            question: 'How many squares can a knight in the center reach?',
            options: ['4', '6', '8', '12'],
            correctIndex: 2,
            explanation:
                'A knight in the center can reach 8 squares! On the edge it reaches fewer.',
          ),
        ],
      );

  static Lesson get _jumpingOverWalls => const Lesson(
        id: 'ch6_l2',
        title: 'Jumping Over Walls',
        description: 'Knights can jump!',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "Here's what makes the knight REALLY special: it's the only piece that can JUMP over other pieces!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/3PPP2/3PNP2/3PPP2/8/8 w - - 0 1',
            message:
                "See? The knight is completely surrounded by pawns, but it can still move! It jumps right over them!",
            highlightSquares: ['d6', 'f6', 'c5', 'g5', 'c3', 'g3', 'd2', 'f2'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/3PPP2/3PNP2/3PPP2/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd6'), ('e4', 'f6'),
              ('e4', 'c5'), ('e4', 'g5'),
              ('e4', 'c3'), ('e4', 'g3'),
              ('e4', 'd2'), ('e4', 'f2'),
            ],
            hintMessage: 'Jump the knight over the pawns!',
            successMessage: "The knight leaps over everything!",
          ),
          MascotSpeechStep(
            message:
                "No other piece can jump! Rooks, bishops, and queens are all blocked by pieces in their way. But not the knight!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _knightsTour => const Lesson(
        id: 'ch6_l3',
        title: "Knight's Tour",
        description: 'Visit all the target squares!',
        xpReward: 30,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message:
                "Challenge time! Can you move the knight to visit all the starred squares?",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "Remember the L-shape! Plan your path carefully!",
            emotion: 'thinking',
          ),
          // Simplified knight tour: visit 4 target squares
          CaptureChallenge(
            fen: '8/2p5/8/5p2/8/2N5/8/6p1 w - - 0 1',
            targetMoves: 4,
            piece: 'N',
            message: 'Visit all marked squares with the knight!',
          ),
        ],
      );

  static Lesson get _knightForkPreview => const Lesson(
        id: 'ch6_l4',
        title: 'Knight Fork Preview',
        description: 'Attack two at once!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Here's a sneak peek at one of the knight's most powerful tricks: the FORK!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/8/5N2/8/4K3 w - - 0 1',
            message:
                "What if the knight could attack the enemy king AND another piece at the same time?",
            arrows: [('f3', 'e5')],
            objectiveSquares: ['e5'],
          ),
          WaitForMoveStep(
            fen: '3qk3/8/8/8/8/5N2/8/4K3 w - - 0 1',
            acceptedMoves: [('f3', 'e5')],
            hintMessage: 'Move the knight to e5 to fork the king and queen!',
            successMessage: "FORK! The knight attacks the king AND the queen!",
          ),
          MascotSpeechStep(
            message:
                "The enemy must save the king, so you capture the queen for free! We'll practice forks more later!",
            emotion: 'happy',
          ),
          MascotSpeechStep(
            message:
                "The knight is worth 3 points and is full of tricks! It's my favorite piece... for obvious reasons!",
            emotion: 'excited',
          ),
        ],
      );
}
