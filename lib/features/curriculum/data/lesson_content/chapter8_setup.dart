import '../../domain/entities/lesson.dart';

/// Chapter 8: "The Secret Passages" — Castling, en passant, promotion.
class Chapter8Content {
  static List<Lesson> get lessons => [
        _castleSwap,
        _sneakyCapture,
        _transformation,
      ];

  static Lesson get _castleSwap => const Lesson(
        id: 'ch8_l1',
        title: 'The Castle Swap',
        description: 'King and rook team up!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "I found a SECRET PASSAGE! It's called CASTLING — the King and Rook swap places in one move!",
            emotion: 'surprised',
          ),
          ShowPositionStep(
            fen: 'r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq - 0 1',
            message: "The King jumps two squares toward the Rook, and the Rook leaps over! Both move at once!",
            arrows: [('e1', 'g1'), ('h1', 'f1')],
            highlightSquares: ['g1', 'f1'],
          ),
          MascotSpeechStep(
            message: "Castling does TWO things at once — hides the King behind pawns AND activates the Rook! Best deal in chess!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "But the passage has RULES:\n- King and Rook haven't moved yet\n- No pieces between them\n- King isn't in check\n- King doesn't pass through danger!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "Why is castling so important?",
            options: [
              "It looks cool",
              "It protects the King AND activates the Rook",
              "It gives you extra points",
            ],
            correctIndex: 1,
            explanation: "Two benefits in one move! The King hides behind pawns, and the Rook joins the fight!",
          ),
        ],
      );

  static Lesson get _sneakyCapture => const Lesson(
        id: 'ch8_l2',
        title: 'The Sneaky Capture',
        description: 'En passant — the ghost move!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "There's a sneaky trick called EN PASSANT. It's French for 'in passing' — like catching a spy!",
            emotion: 'storytelling',
          ),
          ShowPositionStep(
            fen: '8/8/8/4Pp2/8/8/8/8 w - f6 0 1',
            message: "That black pawn just jumped two squares to land beside your pawn. You can capture it as if it only moved one!",
            arrows: [('e5', 'f6')],
            objectiveSquares: ['f6'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/4Pp2/8/8/8/8 w - f6 0 1',
            acceptedMoves: [('e5', 'f6')],
            hintMessage: "Capture the pawn en passant — move diagonally to f6!",
            successMessage: "GOTCHA! You caught the spy mid-jump! En passant!",
          ),
          MascotSpeechStep(
            message: "Important: you can ONLY do en passant on the VERY NEXT move! Wait too long and the chance vanishes!",
            emotion: 'worried',
          ),
        ],
      );

  static Lesson get _transformation => const Lesson(
        id: 'ch8_l3',
        title: 'The Transformation',
        description: 'Pawns become queens!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "Remember how a pawn transforms when it reaches the other side? Let's master that power!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/4P3/8/8/8/8/8/4K3 w - - 0 1',
            message: "This pawn is ONE step from the end! Push it forward and watch the magic!",
            arrows: [('e7', 'e8')],
            objectiveSquares: ['e8'],
          ),
          MascotSpeechStep(
            message: "You can become a Queen, Rook, Bishop, or Knight. Almost ALWAYS pick the Queen — she's the strongest!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "When should you NOT promote to a Queen?",
            options: [
              "Never — always pick Queen",
              "When a Knight gives checkmate but a Queen doesn't",
              "When you already have a Queen",
            ],
            correctIndex: 1,
            explanation: "Sometimes a Knight promotion gives an instant checkmate! It's called underpromotion — rare but brilliant!",
          ),
          MascotSpeechStep(
            message: "Every pawn is a potential Queen! That's why pawns are more valuable than they look!",
            emotion: 'proud',
          ),
        ],
      );
}
