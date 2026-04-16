import '../../domain/entities/lesson.dart';

/// Chapter 5: The Queen - combines rook and bishop movement.
class Chapter5Content {
  static List<Lesson> get lessons => [
        _mightyQueen,
        _queenDomination,
        _queenMission,
      ];

  static Lesson get _mightyQueen => const Lesson(
        id: 'ch5_l1',
        title: 'The Mighty Queen',
        description: 'She moves like rook AND bishop!',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "The Queen is the most powerful piece on the board! She combines the powers of the rook AND the bishop!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4Q3/8/8/8 w - - 0 1',
            message:
                'The queen can move in straight lines like a rook...',
            arrows: [
              ('e4', 'e8'),
              ('e4', 'e1'),
              ('e4', 'a4'),
              ('e4', 'h4'),
            ],
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4Q3/8/8/8 w - - 0 1',
            message:
                '...AND diagonally like a bishop! She can go anywhere!',
            arrows: [
              ('e4', 'h7'),
              ('e4', 'b7'),
              ('e4', 'h1'),
              ('e4', 'b1'),
            ],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4Q3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'e5'), ('e4', 'e6'), ('e4', 'e7'), ('e4', 'e8'),
              ('e4', 'e3'), ('e4', 'e2'), ('e4', 'e1'),
              ('e4', 'a4'), ('e4', 'b4'), ('e4', 'c4'), ('e4', 'd4'),
              ('e4', 'f4'), ('e4', 'g4'), ('e4', 'h4'),
              ('e4', 'f5'), ('e4', 'g6'), ('e4', 'h7'),
              ('e4', 'd5'), ('e4', 'c6'), ('e4', 'b7'), ('e4', 'a8'),
              ('e4', 'f3'), ('e4', 'g2'), ('e4', 'h1'),
              ('e4', 'd3'), ('e4', 'c2'), ('e4', 'b1'),
            ],
            hintMessage: 'Move the queen in any direction!',
            successMessage: "The queen is unstoppable!",
            showValidMoves: true,
          ),
          MascotSpeechStep(
            message:
                "The queen is worth 9 points - more than any other piece! Protect her!",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _queenDomination => const Lesson(
        id: 'ch5_l2',
        title: 'Queen Domination',
        description: 'Cover as many squares as you can!',
        xpReward: 25,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message:
                "Did you know that a queen in the center of the board can attack 27 squares? Let's see it!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/3Q4/8/8/8/8 w - - 0 1',
            message:
                "From d5, the queen controls 27 squares! The center is the most powerful spot!",
            highlightSquares: [
              'd1', 'd2', 'd3', 'd4', 'd6', 'd7', 'd8',
              'a5', 'b5', 'c5', 'e5', 'f5', 'g5', 'h5',
              'c6', 'b7', 'a8', 'e6', 'f7', 'g8',
              'c4', 'b3', 'a2', 'e4', 'f3', 'g2', 'h1',
            ],
          ),
          QuizStep(
            question: 'Where is the queen most powerful?',
            options: ['In the corner', 'On the edge', 'In the center'],
            correctIndex: 2,
            explanation:
                'In the center! The queen can reach more squares from the center than from any other position.',
          ),
          MascotSpeechStep(
            message: "You understand the queen's power now! Use it wisely!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _queenMission => const Lesson(
        id: 'ch5_l3',
        title: "The Queen's Mission",
        description: 'Capture all targets efficiently!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Use the queen to capture all enemy pieces!",
            emotion: 'excited',
          ),
          CaptureChallenge(
            fen: '3p4/8/8/p3Q2p/8/8/8/4p3 w - - 0 1',
            targetMoves: 4,
            piece: 'Q',
            message: 'Capture all 4 black pawns with the queen!',
          ),
        ],
      );
}
