import '../../domain/entities/lesson.dart';

/// Chapter 22: King Safety.
class Chapter22Content {
  static List<Lesson> get lessons => [
        _pawnShield,
        _attackingTheKing,
      ];

  static Lesson get _pawnShield => const Lesson(
        id: 'ch22_l1',
        title: 'Pawn Shield',
        description: 'Pawns protect the king',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "After castling, the pawns in front of your king form a SHIELD. Keep them intact!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '6k1/5ppp/8/8/8/8/5PPP/6K1 w - - 0 1',
            message: "Both kings are safely behind their pawn shields. The f, g, and h pawns protect the castled king.",
            highlightSquares: ['f2', 'g2', 'h2', 'f7', 'g7', 'h7'],
          ),
          ShowPositionStep(
            fen: '6k1/5p1p/6p1/8/8/8/5PPP/6K1 w - - 0 1',
            message: "Black played ...g6. This weakens the dark squares around the king (f6, h6). Attackers love weak squares near the king!",
            dangerSquares: ['f6', 'h6'],
          ),
          MascotSpeechStep(
            message: "Rules for pawn shields:\n- Don't move the pawns in front of your king unless necessary\n- h3/g3 is usually okay; pushing two pawns is risky\n- If your shield is damaged, think about hiding the king elsewhere",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Why is it dangerous to push the pawns in front of your castled king?',
            options: [
              "It wastes time",
              "It creates weak squares for the opponent to attack",
              "Pawns are more useful in the center",
              "It blocks the rook",
            ],
            correctIndex: 1,
            explanation: "Moving shield pawns creates holes and weak squares around the king that attackers can exploit!",
          ),
        ],
      );

  static Lesson get _attackingTheKing => const Lesson(
        id: 'ch22_l2',
        title: 'Attacking the King',
        description: 'Build a powerful attack!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "To attack the enemy king, you need to bring MORE pieces near it than the defender has! Quantity beats quality!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'r4rk1/5ppp/8/8/8/4BN2/5PPP/4R1K1 w - - 0 1',
            message: "White has a knight on f3, bishop on e3, and rook on e1 all aimed at the kingside. Three attackers vs weak defense!",
            arrows: [('f3', 'g5'), ('e3', 'h6'), ('e1', 'e7')],
          ),
          MascotSpeechStep(
            message: "Attack recipe:\n1. Gather 3+ pieces aimed at the king\n2. Open lines (files/diagonals) toward the king\n3. Look for sacrifices to break through the pawn shield\n4. Deliver the final blow!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'When should you attack the enemy king?',
            options: [
              'Always, from move 1',
              'Only in the endgame',
              "When you have more pieces aimed at the king than the defender",
              'Only with the queen',
            ],
            correctIndex: 2,
            explanation: "Attack when you have a numerical advantage of pieces near the enemy king! Don't attack with just one or two pieces.",
          ),
          MascotSpeechStep(
            message: "But always check YOUR king's safety first! A counter-attack can be devastating if your king is exposed!",
            emotion: 'thinking',
          ),
        ],
      );
}
