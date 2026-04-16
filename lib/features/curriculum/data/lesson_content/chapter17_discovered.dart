import '../../domain/entities/lesson.dart';

/// Chapter 17: Discovered Attacks & Double Check.
class Chapter17Content {
  static List<Lesson> get lessons => [
        _hiddenAttacker,
        _doubleCheck,
      ];

  static Lesson get _hiddenAttacker => const Lesson(
        id: 'ch17_l1',
        title: 'The Hidden Attacker',
        description: 'Move one, reveal another!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "A DISCOVERED ATTACK happens when you move one piece and REVEAL an attack from a piece behind it!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '4k3/8/4q3/8/4N3/8/8/4RK2 w - - 0 1',
            message:
                "If the knight on e4 moves, the rook on e1 will attack the queen on e6! The knight was blocking the line.",
            arrows: [('e4', 'f6'), ('e1', 'e6')],
          ),
          MascotSpeechStep(
            message:
                "The secret: the piece you move can ALSO attack something! So you threaten TWO things at once - just like a fork, but sneakier!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '2k1r3/8/8/3N4/8/8/8/3RK3 w - - 0 1',
            acceptedMoves: [('d5', 'e7'), ('d5', 'c7'), ('d5', 'b6'), ('d5', 'f6')],
            hintMessage: 'Move the knight to discover an attack on the rook from your rook!',
            successMessage: "DISCOVERED ATTACK! Your rook now attacks through the line the knight cleared!",
            failMessage: "Move the knight off the d-file so your rook can attack!",
          ),
          QuizStep(
            question: 'A discovered attack happens when...',
            options: [
              "You discover a new piece",
              "You move a piece, revealing an attack from behind it",
              "Your opponent makes a mistake",
              "You check the king",
            ],
            correctIndex: 1,
            explanation:
                "You move one piece out of the way, revealing an attack from a piece that was behind it!",
          ),
          MascotSpeechStep(
            message: "Discovered attacks are devastating because they create TWO threats!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _doubleCheck => const Lesson(
        id: 'ch17_l2',
        title: 'Double Check',
        description: 'Two attackers at once!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message:
                "DOUBLE CHECK is the most powerful discovered attack: BOTH the moving piece AND the revealed piece give check!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4N3/8/8/4BK2 w - - 0 1',
            message:
                "If the knight on e4 moves to d6, BOTH the knight AND the bishop give check! That's double check!",
            arrows: [('e4', 'd6'), ('e1', 'e8')],
            dangerSquares: ['e8'],
          ),
          MascotSpeechStep(
            message:
                "Double check is so powerful because you CANNOT block or capture both attackers! The king MUST move - it's the only option!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/3N4/8/8/3BK3 w - - 0 1',
            acceptedMoves: [('d4', 'e6'), ('d4', 'f5'), ('d4', 'c6')],
            hintMessage: 'Move the knight to give double check (both knight and bishop attack the king)!',
            successMessage: "DOUBLE CHECK! The king must run - nothing else can save it!",
            failMessage: "The knight needs to give check while also revealing the bishop's check on the king.",
          ),
          QuizStep(
            question: 'How do you escape double check?',
            options: [
              "Block one of the attackers",
              "Capture one of the attackers",
              "The king must move - no other option!",
              "You can't escape it",
            ],
            correctIndex: 2,
            explanation:
                "The king MUST move! You can't block or capture two attackers with one move, so the king is the only answer.",
          ),
          MascotSpeechStep(
            message: "Double check often leads to checkmate because the king's options are so limited!",
            emotion: 'happy',
          ),
        ],
      );
}
