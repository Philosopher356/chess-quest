import '../../domain/entities/lesson.dart';

/// Chapter 24: Complex Endgames - Lucena, Philidor, etc.
class Chapter24Content {
  static List<Lesson> get lessons => [
        _rookEndgames,
        _bishopEndgames,
      ];

  static Lesson get _rookEndgames => const Lesson(
        id: 'ch24_l1',
        title: 'Rook Endgames',
        description: 'The most common endgame',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "Rook endgames happen in over half of all games! Two crucial positions to know: Lucena and Philidor.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '3K4/3P1k2/8/8/8/8/8/4R3 w - - 0 1',
            message: "LUCENA POSITION: White has king on d8, pawn on d7, rook on e1. This is a WIN! The technique is called 'building a bridge'.",
            highlightSquares: ['d8', 'd7'],
          ),
          MascotSpeechStep(
            message: "Bridge building: 1) Move king to the side 2) Use the rook on the 4th rank to block enemy rook checks 3) Promote!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/3pk3/8/8/8/8/8/3RK3 b - - 0 1',
            message: "PHILIDOR POSITION: Black defends! Keep the rook on the 6th rank to prevent the white king from advancing. When the pawn advances, go to the back rank for checks!",
            highlightSquares: ['d7'],
          ),
          MascotSpeechStep(
            message: "Two positions, two results:\n- Lucena = the attacker wins (build a bridge)\n- Philidor = the defender draws (rook on 6th rank)\n\nKnowing these saves you many games!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'In the Philidor position, where should the defending rook stay?',
            options: ['On the 8th rank', 'On the 6th rank', 'Next to the king', 'On the same file as the pawn'],
            correctIndex: 1,
            explanation: "The 6th rank! This prevents the attacking king from advancing. Once the pawn pushes to the 6th, go to the back rank for checking distance.",
          ),
        ],
      );

  static Lesson get _bishopEndgames => const Lesson(
        id: 'ch24_l2',
        title: 'Bishop Endgames',
        description: 'Same vs opposite color',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Bishop endgames have a special rule: OPPOSITE-colored bishop endgames are extremely drawish!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/5b2/8/3pp3/3PP3/8/2B5/8 w - - 0 1',
            message: "SAME-COLOR bishops: both on light squares. Normal endgame - the extra pawn often wins.",
          ),
          ShowPositionStep(
            fen: '8/2b5/8/3pp3/3PP3/8/5B2/8 w - - 0 1',
            message: "OPPOSITE-COLOR bishops: one on light, one on dark. Even being 2 pawns up can be a draw! The bishops can't interact!",
            highlightSquares: ['c7', 'f2'],
          ),
          MascotSpeechStep(
            message: "With opposite-colored bishops, the defender puts pawns on the same color as their bishop. The attacker's bishop can't attack those pawns!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Why are opposite-colored bishop endgames often drawn?',
            options: [
              "The bishops cancel each other out",
              "Each bishop controls squares the other can't reach",
              "Bishops are weak in endgames",
              "You need a rook to win",
            ],
            correctIndex: 1,
            explanation: "Each bishop controls squares the other can never reach! The defender can blockade on the color of their bishop, and the attacker's bishop can't break through.",
          ),
        ],
      );
}
