import '../../domain/entities/lesson.dart';

/// Chapter 9: Check - king under attack, three escape methods.
class Chapter9Content {
  static List<Lesson> get lessons => [
        _kingInDanger,
        _findTheCheck,
        _escapeTheCheck,
      ];

  static Lesson get _kingInDanger => const Lesson(
        id: 'ch9_l1',
        title: 'The King is in Danger!',
        description: 'What happens when a piece attacks the king',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "When a piece directly attacks the enemy king, we say the king is IN CHECK!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4R3/8/8/4K3 w - - 0 1',
            message:
                "The white rook attacks the black king along the e-file. The king is in CHECK!",
            arrows: [('e4', 'e8')],
            dangerSquares: ['e8'],
          ),
          MascotSpeechStep(
            message:
                "When your king is in check, you MUST deal with it immediately! You can't ignore it or make any other move.",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message:
                "There are THREE ways to escape check:\n1. MOVE the king to a safe square\n2. BLOCK the attack with another piece\n3. CAPTURE the attacking piece",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4R3/8/8/4K3 b - - 0 1',
            message:
                "Method 1: MOVE! The black king can step aside to d8, d7, f8, or f7 to escape.",
            highlightSquares: ['d8', 'f8', 'd7', 'f7'],
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4R3/4n3/8/4K3 b - - 0 1',
            message:
                "Method 2: BLOCK! A piece can step in between the attacker and the king. The knight on e3 could block!",
            arrows: [('e3', 'e5')],
            objectiveSquares: ['e5', 'e6', 'e7'],
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4R2b/8/8/4K3 b - - 0 1',
            message:
                "Method 3: CAPTURE! The bishop on h4 can capture the rook!",
            arrows: [('h4', 'e4')],
            objectiveSquares: ['e4'],
          ),
          MascotSpeechStep(
            message:
                "Remember: you MUST escape check! If you can't do any of these three things... it's checkmate!",
            emotion: 'thinking',
          ),
        ],
      );

  static Lesson get _findTheCheck => const Lesson(
        id: 'ch9_l2',
        title: 'Find the Check',
        description: 'Which move gives check?',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Can you find the move that gives check to the enemy king?",
            emotion: 'excited',
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/8/8/4R3/4K3 w - - 0 1',
            acceptedMoves: [('e2', 'e7'), ('e2', 'e8')],
            hintMessage: 'Move the rook to attack the black king on the e-file!',
            successMessage: "CHECK! The rook attacks the king!",
            failMessage: "That doesn't give check. Try attacking the king directly!",
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/8/8/5B2/4K3 w - - 0 1',
            acceptedMoves: [('f2', 'b6'), ('f2', 'a7')],
            hintMessage: 'Use the bishop to attack the king diagonally!',
            successMessage: "CHECK! The bishop strikes diagonally!",
            failMessage: "Find a diagonal that reaches the king!",
          ),
          WaitForMoveStep(
            fen: '4k3/8/8/8/8/3N4/8/4K3 w - - 0 1',
            acceptedMoves: [('d3', 'f4'), ('d3', 'c5')],
            hintMessage: 'The knight can give check with its L-shape jump!',
            successMessage: "CHECK! The knight forks its way to the king!",
            failMessage: "Remember the knight's L-shape! Find a square that attacks the king.",
          ),
          MascotSpeechStep(
            message: "Excellent! You're getting good at finding checks!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _escapeTheCheck => const Lesson(
        id: 'ch9_l3',
        title: 'Escape the Check',
        description: 'Three ways to save the king!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Now YOU'RE in check! Find a way to save your king!",
            emotion: 'excited',
          ),
          // Escape by moving
          WaitForMoveStep(
            fen: '8/8/8/8/4r3/8/8/4K3 w - - 0 1',
            acceptedMoves: [('e1', 'd1'), ('e1', 'f1'), ('e1', 'd2'), ('e1', 'f2')],
            hintMessage: 'Move the king to a square not attacked by the rook!',
            successMessage: "Safe! The king escaped by moving!",
            failMessage: "That square is still in danger! Try a different direction.",
          ),
          // Escape by capturing
          WaitForMoveStep(
            fen: '8/8/8/8/8/5b2/8/4KB2 w - - 0 1',
            acceptedMoves: [('f1', 'f3')],
            hintMessage: 'Can you capture the attacking piece?',
            successMessage: "Captured! The bishop takes the attacker!",
            failMessage: "Look for a piece that can capture the checker!",
          ),
          // Escape by blocking
          WaitForMoveStep(
            fen: '8/8/8/8/r7/8/1R6/K7 w - - 0 1',
            acceptedMoves: [('b2', 'a2')],
            hintMessage: 'Block the rook by moving your rook in between!',
            successMessage: "Blocked! The rook shields the king!",
            failMessage: "Try placing a piece between the attacker and your king!",
          ),
          MascotSpeechStep(
            message:
                "You've mastered all three escapes: move, capture, and block! You're ready for checkmate!",
            emotion: 'happy',
          ),
        ],
      );
}
