import '../../domain/entities/lesson.dart';

/// Chapter 4: The Bishop - diagonal movement.
class Chapter4Content {
  static List<Lesson> get lessons => [
        _diagonalRunner,
        _bishopCaptureMission,
        _twoBishops,
      ];

  static Lesson get _diagonalRunner => const Lesson(
        id: 'ch4_l1',
        title: 'The Diagonal Runner',
        description: 'Bishops slide diagonally',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "Meet the Bishop! It wears a pointy hat and loves diagonals!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4B3/8/8/8 w - - 0 1',
            message:
                'The bishop moves diagonally - as many squares as it wants!',
            arrows: [
              ('e4', 'h7'),
              ('e4', 'b7'),
              ('e4', 'h1'),
              ('e4', 'a8'),
            ],
          ),
          MascotSpeechStep(
            message:
                "Here's something cool: a bishop ALWAYS stays on the same color square! This one started on a light square, so it can only ever visit light squares.",
            emotion: 'explaining',
            fen: '8/8/8/8/4B3/8/8/8 w - - 0 1',
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4B3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'f5'), ('e4', 'g6'), ('e4', 'h7'),
              ('e4', 'd5'), ('e4', 'c6'), ('e4', 'b7'), ('e4', 'a8'),
              ('e4', 'f3'), ('e4', 'g2'), ('e4', 'h1'),
              ('e4', 'd3'), ('e4', 'c2'), ('e4', 'b1'),
            ],
            hintMessage: 'Move the bishop along any diagonal!',
            successMessage: "The bishop glides diagonally!",
            showValidMoves: true,
          ),
          QuizStep(
            question: 'Can a bishop on a light square ever reach a dark square?',
            options: ['Yes', 'No'],
            correctIndex: 1,
            explanation:
                "No! A bishop is forever trapped on its starting color. That's why you need BOTH bishops to cover the whole board!",
          ),
          MascotSpeechStep(
            message:
                "The bishop is worth 3 points - the same as a knight! They're a great pair.",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _bishopCaptureMission => const Lesson(
        id: 'ch4_l2',
        title: 'Bishop Capture Mission',
        description: 'Capture targets diagonally!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Time to practice! Capture the enemy pawns with your bishop!",
            emotion: 'excited',
          ),
          CaptureChallenge(
            fen: '8/1p3p2/8/8/3B4/8/8/8 w - - 0 1',
            targetMoves: 2,
            piece: 'B',
            message: 'Capture both black pawns with the bishop!',
          ),
        ],
      );

  static Lesson get _twoBishops => const Lesson(
        id: 'ch4_l3',
        title: 'Two Bishops Team Up',
        description: 'Together they cover everything!',
        xpReward: 20,
        steps: [
          ShowPositionStep(
            fen: '8/8/8/8/3BB3/8/8/8 w - - 0 1',
            message:
                "One bishop covers light squares, the other covers dark squares. Together, they rule the board!",
            highlightSquares: ['d4', 'e4'],
          ),
          MascotSpeechStep(
            message:
                "That's why losing a bishop is a big deal - your remaining bishop can only reach half the squares!",
            emotion: 'thinking',
          ),
          QuizStep(
            question: 'How many points is a bishop worth?',
            options: ['1 point', '3 points', '5 points', '9 points'],
            correctIndex: 1,
            explanation: 'A bishop is worth 3 points, the same as a knight!',
          ),
          MascotSpeechStep(
            message:
                "Great work! You now know the bishop - the diagonal master!",
            emotion: 'happy',
          ),
        ],
      );
}
