import '../../domain/entities/lesson.dart';

/// Chapter 18: Deflection, Decoy, Overloading.
class Chapter18Content {
  static List<Lesson> get lessons => [
        _lureThem,
        _tooManyJobs,
        _mixedTrainer,
      ];

  static Lesson get _lureThem => const Lesson(
        id: 'ch18_l1',
        title: 'Lure Them Away',
        description: 'Deflection and decoy tricks!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "DEFLECTION: force a defending piece away from what it's protecting! Like luring a guard away from the door!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '3rk3/8/8/8/8/8/8/R3K3 w - - 0 1',
            message:
                "The black rook on d8 defends the back rank. If we can lure it away, we can deliver checkmate!",
            arrows: [('a1', 'a8')],
          ),
          MascotSpeechStep(
            message:
                "DECOY is similar: you sacrifice a piece to FORCE an enemy piece onto a bad square!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '6k1/3q1ppp/8/8/8/5Q2/5PPP/6K1 w - - 0 1',
            message:
                "If we play Qf8+!, the king must take (Kxf8) and then we've decoyed the king to f8 for a tactic later!",
            arrows: [('f3', 'f8')],
          ),
          QuizStep(
            question: 'What is deflection?',
            options: [
              "Moving your piece away",
              "Forcing an enemy piece away from what it defends",
              "A type of checkmate",
              "Moving the king to safety",
            ],
            correctIndex: 1,
            explanation:
                "Deflection forces a defending piece away from its duty! Once the defender is gone, the target is vulnerable.",
          ),
          MascotSpeechStep(
            message: "Deflection and decoy often involve sacrificing a piece to gain something bigger!",
            emotion: 'thinking',
          ),
        ],
      );

  static Lesson get _tooManyJobs => const Lesson(
        id: 'ch18_l2',
        title: 'Too Many Jobs',
        description: 'Overloaded pieces break down!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "An OVERLOADED piece is one that has too many defensive jobs! It can't do everything at once!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '3rk3/5r2/8/8/8/8/8/R3K2R w - - 0 1',
            message:
                "The black rook on f7 defends the rook on d8 AND protects f8. It has TWO jobs! What if we attack both?",
            arrows: [('f7', 'd7'), ('f7', 'f8')],
            dangerSquares: ['f7'],
          ),
          MascotSpeechStep(
            message:
                "When you spot an overloaded piece, attack BOTH things it defends. It can only save one!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'An overloaded piece is one that...',
            options: [
              "Has too much material value",
              "Has to defend two or more things at once",
              "Is in the center of the board",
              "Has no legal moves",
            ],
            correctIndex: 1,
            explanation:
                "An overloaded piece is trying to defend multiple things at once. Attack both, and it can't handle everything!",
          ),
          MascotSpeechStep(
            message: "Look for overloaded pieces in every game. They're everywhere once you know what to spot!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _mixedTrainer => const Lesson(
        id: 'ch18_l3',
        title: 'Mixed Tactics Trainer',
        description: 'Test all your tactics!',
        xpReward: 35,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message: "Time to test everything you've learned! Each puzzle uses a different tactic!",
            emotion: 'excited',
          ),
          // Fork puzzle
          WaitForMoveStep(
            fen: 'r3k3/8/8/8/5N2/8/8/4K3 w - - 0 1',
            acceptedMoves: [('f4', 'd5')],
            hintMessage: 'Find the knight fork!',
            successMessage: "FORK! Knight attacks king and rook!",
            failMessage: "Which square lets the knight attack both the king and rook?",
          ),
          // Pin puzzle
          WaitForMoveStep(
            fen: '4k3/8/4n3/8/8/8/4R3/4K3 w - - 0 1',
            acceptedMoves: [('e2', 'e5')],
            hintMessage: 'Pin the knight to the king!',
            successMessage: "PIN! The rook pins the knight to the king!",
            failMessage: "Move the rook to pin the knight on the e-file!",
          ),
          // Skewer puzzle
          WaitForMoveStep(
            fen: '4k3/8/8/4B3/8/8/8/4K2q w - - 0 1',
            acceptedMoves: [('e5', 'h2')],
            hintMessage: "Skewer the king and queen with the bishop!",
            successMessage: "SKEWER! King must move, bishop takes queen!",
          ),
          MascotSpeechStep(
            message: "Incredible! You know forks, pins, skewers, and more! You're becoming a real tactician!",
            emotion: 'happy',
          ),
        ],
      );
}
