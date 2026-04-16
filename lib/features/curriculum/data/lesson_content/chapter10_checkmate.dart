import '../../domain/entities/lesson.dart';

/// Chapter 10: Checkmate - no escape from check.
class Chapter10Content {
  static List<Lesson> get lessons => [
        _gameOver,
        _mateInOne,
        _isItCheckmate,
      ];

  static Lesson get _gameOver => const Lesson(
        id: 'ch10_l1',
        title: 'Game Over!',
        description: 'When there is no escape',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Checkmate is when the king is in check AND there's no way to escape! The game is over!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/4R3/8/8/8/8/8/4K2R w - - 0 1',
            message:
                "Look: the rook on e7 gives check. The king can't move (h-rook controls rank 8), can't block, can't capture. CHECKMATE!",
            dangerSquares: ['d8', 'f8', 'd7', 'f7'],
            arrows: [('e7', 'e8'), ('h1', 'h8')],
          ),
          MascotSpeechStep(
            message:
                "Check = king is attacked. Checkmate = king is attacked AND no escape exists. Big difference!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '6k1/5ppp/8/8/8/8/8/4R1K1 w - - 0 1',
            message:
                "This is the famous 'back rank mate' pattern. The king is trapped by its own pawns!",
            arrows: [('e1', 'e8')],
            dangerSquares: ['g8'],
          ),
          MascotSpeechStep(
            message:
                "The goal of chess is to checkmate the enemy king. That's how you win!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _mateInOne => const Lesson(
        id: 'ch10_l2',
        title: 'Checkmate in 1',
        description: 'Find the winning move!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "Find the ONE move that delivers checkmate! Think carefully!",
            emotion: 'excited',
          ),
          // Back rank mate
          WaitForMoveStep(
            fen: '6k1/5ppp/8/8/8/8/8/R3K3 w - - 0 1',
            acceptedMoves: [('a1', 'a8')],
            hintMessage: 'The king is trapped on the back rank by its own pawns...',
            successMessage: "CHECKMATE! Back rank mate! The rook delivers the final blow!",
            failMessage: "Look at the enemy king - it's trapped by its own pawns. How can you exploit that?",
          ),
          // Queen mate
          WaitForMoveStep(
            fen: 'k7/8/1K6/8/8/8/8/1Q6 w - - 0 1',
            acceptedMoves: [('b1', 'a2'), ('b1', 'b7')],
            hintMessage: "The queen can deliver mate if it gets close to the king!",
            successMessage: "CHECKMATE! The queen and king work together!",
            failMessage: "Get the queen next to the enemy king while your king supports!",
          ),
          // Simple rook mate
          WaitForMoveStep(
            fen: 'k7/2R5/1K6/8/8/8/8/8 w - - 0 1',
            acceptedMoves: [('c7', 'a7')],
            hintMessage: "The rook can slide along rank 7 to deliver mate!",
            successMessage: "CHECKMATE! The rook on the 7th rank is deadly!",
          ),
          MascotSpeechStep(
            message: "Amazing! You found all the checkmates! You're a natural!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _isItCheckmate => const Lesson(
        id: 'ch10_l3',
        title: 'Is it Checkmate?',
        description: 'Check, checkmate, or neither?',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Let's test your knowledge! Is each position check, checkmate, or neither?",
            emotion: 'excited',
          ),
          QuizStep(
            question: 'Black king on g8, white rook on e8, white king on e1. Is this...',
            options: ['Check', 'Checkmate', 'Neither'],
            correctIndex: 0,
            explanation: "It's check! The rook attacks the king, but the king can escape to f7, g7, or h7.",
            fen: '4R1k1/8/8/8/8/8/8/4K3 w - - 0 1',
          ),
          QuizStep(
            question: 'Black king on h8, white queen on g6, white king on g1. Is this...',
            options: ['Check', 'Checkmate', 'Neither'],
            correctIndex: 2,
            explanation: "Neither! The queen doesn't attack h8 from g6. The king is safe... for now!",
            fen: '7k/8/6Q1/8/8/8/8/6K1 w - - 0 1',
          ),
          QuizStep(
            question: 'Black king on g8 with pawns on f7, g7, h7. White rook on a8. Is this...',
            options: ['Check', 'Checkmate', 'Neither'],
            correctIndex: 1,
            explanation: "CHECKMATE! The rook attacks on the back rank and the king's own pawns trap it!",
            fen: 'R5k1/5ppp/8/8/8/8/8/6K1 w - - 0 1',
          ),
          MascotSpeechStep(
            message: "You can tell the difference between check, checkmate, and safety! Well done!",
            emotion: 'happy',
          ),
        ],
      );
}
