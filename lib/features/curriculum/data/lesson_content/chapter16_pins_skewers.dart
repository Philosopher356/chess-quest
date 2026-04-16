import '../../domain/entities/lesson.dart';

/// Chapter 16: Pins & Skewers.
class Chapter16Content {
  static List<Lesson> get lessons => [
        _thePin,
        _pinPuzzles,
        _theSkewer,
      ];

  static Lesson get _thePin => const Lesson(
        id: 'ch16_l1',
        title: 'The Pin',
        description: "A piece that can't move!",
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "A PIN is when a piece is stuck in place because moving it would expose a more valuable piece behind it!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/4r3/8/8/4B3/8/8/4K3 w - - 0 1',
            message:
                "The bishop pins the rook to the king! The rook can't move because the king would be in check!",
            arrows: [('e4', 'e7'), ('e4', 'e8')],
            dangerSquares: ['e7'],
          ),
          MascotSpeechStep(
            message:
                "ABSOLUTE PIN: pinned to the king (the piece literally can't move - it's illegal).\nRELATIVE PIN: pinned to a valuable piece (CAN move, but shouldn't).",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/4q3/8/4B3/8/8/8/4K3 w - - 0 1',
            message:
                "This is a RELATIVE pin. The queen COULD move, but then the bishop would take the king - wait, that's absolute too! Either way, the queen is stuck.",
            arrows: [('e5', 'e7'), ('e5', 'e8')],
          ),
          ShowPositionStep(
            fen: '2k5/8/2n5/8/8/2B5/8/2K5 w - - 0 1',
            message:
                "Here the bishop pins the knight to the king. The knight is absolutely pinned and cannot move at all!",
            arrows: [('c3', 'c6'), ('c3', 'c8')],
            dangerSquares: ['c6'],
          ),
          QuizStep(
            question: 'In an absolute pin, why can\'t the pinned piece move?',
            options: [
              "It's too heavy",
              "Moving it would expose the king to check (illegal)",
              "It's protecting another piece",
              "The opponent won't allow it",
            ],
            correctIndex: 1,
            explanation:
                "Moving an absolutely pinned piece would put your own king in check, which is illegal!",
          ),
        ],
      );

  static Lesson get _pinPuzzles => const Lesson(
        id: 'ch16_l2',
        title: 'Pin Puzzles',
        description: 'Find and use the pin!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "Find the move that creates a pin!",
            emotion: 'excited',
          ),
          WaitForMoveStep(
            fen: 'r1bqk2r/pppp1ppp/2n2n2/4p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 0 1',
            acceptedMoves: [('c1', 'g5')],
            hintMessage: 'Pin the knight on f6 to the queen! Which bishop move does that?',
            successMessage: "PIN! The bishop pins the knight to the queen! The knight is stuck!",
            failMessage: "Look for a way to attack the knight on f6 with a bishop, knowing the queen is behind it on d8.",
          ),
          WaitForMoveStep(
            fen: 'r2qkb1r/ppp1pppp/2n2n2/3p4/8/2N2N2/PPPPPPPP/R1BQKB1R w KQkq - 0 1',
            acceptedMoves: [('f1', 'b5')],
            hintMessage: 'Pin a knight to the king with your bishop!',
            successMessage: "PIN! The bishop on b5 pins the knight on c6 to the king on e8!",
          ),
          MascotSpeechStep(
            message:
                "Once a piece is pinned, you can pile up attackers on it! A pinned piece is a weak piece!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _theSkewer => const Lesson(
        id: 'ch16_l3',
        title: 'The Skewer',
        description: 'Attack through a piece!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "A SKEWER is like a reverse pin! You attack a valuable piece, and when it moves, you capture the piece BEHIND it!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4R3/8/8/4K2q w - - 0 1',
            message:
                "The rook gives check to the king! When the king moves, the rook captures the queen behind it - that's a SKEWER!",
            arrows: [('e4', 'e8'), ('e4', 'h1')],
          ),
          MascotSpeechStep(
            message:
                "Pin = less valuable piece in front, more valuable behind.\nSkewer = more valuable piece in front, less valuable behind.",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '6k1/8/8/8/8/8/B7/4K2r w - - 0 1',
            acceptedMoves: [('a2', 'e6')],
            hintMessage: 'Skewer the king and rook with your bishop!',
            successMessage: "SKEWER! The bishop attacks the king, and after it moves, you take the rook!",
            failMessage: "Find a diagonal where the bishop attacks the king with the rook behind it.",
          ),
          QuizStep(
            question: "What's the difference between a pin and a skewer?",
            options: [
              "They're the same thing",
              "Pin: valuable piece in front; Skewer: valuable piece in back",
              "Pin: valuable piece in back; Skewer: valuable piece in front",
              "Pins use bishops, skewers use rooks",
            ],
            correctIndex: 2,
            explanation:
                "In a pin, the MORE valuable piece is behind (protected). In a skewer, the MORE valuable piece is in front (must move, exposing the one behind).",
          ),
          MascotSpeechStep(
            message: "Pins and skewers use the same concept - a line of attack through pieces!",
            emotion: 'happy',
          ),
        ],
      );
}
