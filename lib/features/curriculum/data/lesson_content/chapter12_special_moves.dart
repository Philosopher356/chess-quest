import '../../domain/entities/lesson.dart';

/// Chapter 12: "The Spy Network" — Finding check, escaping check, delivering mate.
class Chapter12Content {
  static List<Lesson> get lessons => [
        _findTheCheck,
        _escapeTheTrap,
        _deliverTheBlow,
      ];

  static Lesson get _findTheCheck => const Lesson(
        id: 'ch12_l1',
        title: 'Find the Check',
        description: 'Spot the attack!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Our spy network detected enemy movements! Can you find the move that attacks the enemy King? That's called giving CHECK!",
            emotion: 'storytelling',
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/8/8/4R3/4K3 w - - 0 1',
            acceptedMoves: [('e2', 'e7'), ('e2', 'e8')],
            hintMessage: "Move the Rook to attack the King along the e-file!",
            successMessage: "CHECK! The Rook attacks the King directly!",
            failMessage: "Find a move where the Rook directly attacks the King!",
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/8/8/5B2/4K3 w - - 0 1',
            acceptedMoves: [('f2', 'b6'), ('f2', 'a7')],
            hintMessage: "Use the Bishop to attack the King diagonally!",
            successMessage: "CHECK! The Bishop strikes from the diagonal!",
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/8/3N4/8/4K3 w - - 0 1',
            acceptedMoves: [('d3', 'f4'), ('d3', 'c5')],
            hintMessage: "The Knight can give check with its L-shape!",
            successMessage: "CHECK! Sir Hops strikes again!",
          ),
          MascotSpeechStep(
            message: "Every piece can give check! Rooks on files, Bishops on diagonals, Knights with L-shapes!",
            emotion: 'proud',
          ),
        ],
      );

  static Lesson get _escapeTheTrap => const Lesson(
        id: 'ch12_l2',
        title: 'Escape the Trap',
        description: 'Three ways to survive!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "NOW you're the one in check! Save your King! Remember: move, block, or capture!",
            emotion: 'worried',
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4r3/8/8/4K3 w - - 0 1',
            acceptedMoves: [('e1', 'd1'), ('e1', 'f1'), ('e1', 'd2'), ('e1', 'f2')],
            hintMessage: "Your King is in check! Move to a safe square!",
            successMessage: "Escaped by MOVING! Method 1!",
            failMessage: "That square is still in danger!",
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/8/5b2/8/4KB2 w - - 0 1',
            acceptedMoves: [('f1', 'f3')],
            hintMessage: "Can you CAPTURE the attacker?",
            successMessage: "Escaped by CAPTURING! Method 2!",
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/r7/8/1R6/K7 w - - 0 1',
            acceptedMoves: [('b2', 'a2')],
            hintMessage: "BLOCK the attack! Put a piece between the attacker and your King!",
            successMessage: "Escaped by BLOCKING! Method 3! All three methods mastered!",
          ),
          MascotSpeechStep(
            message: "Move, block, or capture — the three escapes from check! If NONE work... it's checkmate!",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _deliverTheBlow => const Lesson(
        id: 'ch12_l3',
        title: 'Deliver the Blow',
        description: 'Checkmate in one move!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "Time to practice the FINISHING MOVE! Find the one move that delivers checkmate!",
            emotion: 'excited',
          ),
          WaitForMoveStep(
            fen: '6k1/5ppp/8/8/8/8/8/R3K3 w - - 0 1',
            acceptedMoves: [('a1', 'a8')],
            hintMessage: "The enemy King is trapped behind its pawns... back rank!",
            successMessage: "CHECKMATE! Back rank ambush!",
          ),
          WaitForMoveStep(
            fen: 'k7/8/1K6/8/8/8/8/1Q6 w - - 0 1',
            acceptedMoves: [('b1', 'a2'), ('b1', 'b7')],
            hintMessage: "The Queen and King work together to trap the enemy!",
            successMessage: "CHECKMATE! The Queen delivers with King support!",
          ),
          WaitForMoveStep(
            fen: 'k7/2R5/1K6/8/8/8/8/8 w - - 0 1',
            acceptedMoves: [('c7', 'a7')],
            hintMessage: "The Rook slides along rank 7 for the kill!",
            successMessage: "CHECKMATE! Rook on the 7th rank is deadly!",
          ),
          MascotSpeechStep(
            message: "Three checkmates delivered! You're ready for anything the Shadow throws at us!",
            emotion: 'proud',
          ),
        ],
      );
}
