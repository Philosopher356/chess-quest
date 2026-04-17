import '../../domain/entities/lesson.dart';

/// Chapter 3: "The Diagonal Forest" — Find the Bishop.
/// (Was: The Rook. Rook is now Chapter 2.)
class Chapter3Content {
  static List<Lesson> get lessons => [
        _forestPath,
        _treasureHunt,
        _lightAndShadow,
      ];

  static Lesson get _forestPath => const Lesson(
        id: 'ch3_l1',
        title: 'The Forest Path',
        description: 'Follow the diagonal trails!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Welcome to the Diagonal Forest! The Bishop lives here. She's mysterious — she can only move along diagonal paths!",
            emotion: 'storytelling',
            fen: '8/8/8/8/8/8/8/2B5 w - - 0 1',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/8/2B5 w - - 0 1',
            message: "The Bishop glides diagonally — try moving her!",
            arrows: [('c1', 'f4'), ('c1', 'a3')],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/8/8/8/2B5 w - - 0 1',
            acceptedMoves: [
              ('c1', 'd2'), ('c1', 'e3'), ('c1', 'f4'), ('c1', 'g5'), ('c1', 'h6'),
              ('c1', 'b2'), ('c1', 'a3'),
            ],
            hintMessage: "Bishops move diagonally! Slide her to any diagonal square!",
            successMessage: "She glides through the forest like a shadow!",
            failMessage: "The Bishop only moves diagonally — try a diagonal path!",
            showValidMoves: true,
          ),
          MascotSpeechStep(
            message:
                "Beautiful! Now here's something weird about the Bishop — watch what color she's on...",
            emotion: 'thinking',
          ),
        ],
      );

  static Lesson get _treasureHunt => const Lesson(
        id: 'ch3_l2',
        title: 'Treasure Hunt',
        description: 'Collect the forest treasures!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "The Bishop found treasure scattered through the forest! Help her collect it all!",
            emotion: 'excited',
          ),
          CaptureChallenge(
            fen: '8/1p3p2/8/8/3B4/8/8/8 w - - 0 1',
            targetMoves: 2,
            piece: 'B',
            message: "Capture both treasures (pawns) diagonally!",
          ),
          MascotSpeechStep(
            message:
                "The Bishop is worth 3 pawns — same as me! She's a great ally, but she has one weakness...",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _lightAndShadow => const Lesson(
        id: 'ch3_l3',
        title: 'Light and Shadow',
        description: 'Two bishops, two colors!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Notice something? This Bishop started on a light square... and she CAN'T reach the dark squares! She's stuck on one color forever!",
            emotion: 'surprised',
            fen: '8/8/8/8/3B4/8/8/8 w - - 0 1',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/3BB3/8/8/8 w - - 0 1',
            message: "That's why you need BOTH bishops! One for light squares, one for dark. Together they cover the whole forest!",
            highlightSquares: ['d4', 'e4'],
          ),
          QuizStep(
            question: "Can a bishop on a light square ever reach a dark square?",
            options: ['Yes, if it tries hard enough', 'No, never!'],
            correctIndex: 1,
            explanation: "Never! A bishop is forever bound to its starting color. That's its magic... and its curse!",
          ),
          MascotSpeechStep(
            message:
                "Two Bishops recruited! Now let's find the most powerful piece of all — the Queen! She's been captured by the Shadow!",
            emotion: 'determined',
          ),
        ],
      );
}
