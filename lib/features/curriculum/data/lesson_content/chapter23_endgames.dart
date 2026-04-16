import '../../domain/entities/lesson.dart';

/// Chapter 23: Endgame Fundamentals.
class Chapter23Content {
  static List<Lesson> get lessons => [
        _kingQueenVsKing,
        _kingRookVsKing,
        _kingPawnEndgames,
        _squareRule,
      ];

  static Lesson get _kingQueenVsKing => const Lesson(
        id: 'ch23_l1',
        title: 'King & Queen vs King',
        description: 'The basic checkmate',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "The most important endgame: King + Queen vs King. You MUST know how to checkmate with this!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "The technique:\n1. Use the queen to push the enemy king to the edge\n2. Bring YOUR king closer to help\n3. Deliver checkmate on the edge",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/4k3/8/8/1Q6/4K3 w - - 0 1',
            message: "Step 1: Use the queen to restrict the enemy king. Push it toward the edge of the board.",
            arrows: [('b2', 'b5'), ('b2', 'e5')],
          ),
          ShowPositionStep(
            fen: 'k7/1Q6/1K6/8/8/8/8/8 w - - 0 1',
            message: "Final position: King on b6, Queen on b7. The enemy king is trapped on a8. Qa7# or Qb8# is checkmate!",
            objectiveSquares: ['a7', 'b8'],
          ),
          MascotSpeechStep(
            message: "WARNING: Be careful not to stalemate! Never trap the king with NO legal moves unless it's checkmate!",
            emotion: 'thinking',
          ),
          FreePlayStep(
            fen: '8/8/4k3/8/8/8/6Q1/4K3 w - - 0 1',
            message: "Try it! Use the queen and king to checkmate the black king. Push it to the edge first!",
          ),
        ],
      );

  static Lesson get _kingRookVsKing => const Lesson(
        id: 'ch23_l2',
        title: 'King & Rook vs King',
        description: 'The box technique',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "King + Rook vs King is trickier than with a queen. Use the BOX TECHNIQUE to trap the enemy king!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "The box technique:\n1. The rook cuts off the enemy king, creating a 'box'\n2. Your king approaches\n3. Make the box smaller and smaller\n4. Checkmate on the edge!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/4k3/8/4R3/8/8/4K3 w - - 0 1',
            message: "The rook on e4 creates a box - the black king cannot cross to ranks 1-4. Now bring the white king up!",
            highlightSquares: ['e4'],
            arrows: [('e4', 'a4'), ('e4', 'h4')],
          ),
          ShowPositionStep(
            fen: '4k3/4R3/4K3/8/8/8/8/8 w - - 0 1',
            message: "White king on e6, rook on e7. The black king is squeezed onto the back rank. Re8# or just wait for the right moment!",
          ),
          MascotSpeechStep(
            message: "This endgame requires patience. The box gets smaller step by step. Don't rush!",
            emotion: 'explaining',
          ),
          FreePlayStep(
            fen: '8/8/3k4/8/3R4/8/8/3K4 w - - 0 1',
            message: "Practice the box technique! Cut off the king with the rook, then bring your king to help.",
          ),
        ],
      );

  static Lesson get _kingPawnEndgames => const Lesson(
        id: 'ch23_l3',
        title: 'King & Pawn Endgames',
        description: 'Opposition is key!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "In king + pawn endings, the concept of OPPOSITION is everything! Let me explain.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/8/4K3/4P3/8/8/8/8 w - - 0 1',
            message: "OPPOSITION: when kings face each other with one square between them, whoever must move loses position. White to move here has the opposition!",
            highlightSquares: ['e6', 'e8'],
            arrows: [('e6', 'e7')],
          ),
          MascotSpeechStep(
            message: "Key rule: if YOUR king is AHEAD of your pawn, you usually win. If the enemy king blocks the path, it might be a draw.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '4k3/4P3/4K3/8/8/8/8/8 w - - 0 1',
            message: "White's king is AHEAD of the pawn (on e6 while the pawn is on e7). White can promote and win!",
            highlightSquares: ['e6', 'e7'],
          ),
          QuizStep(
            question: 'In King + Pawn vs King, what gives the winning side the best chance?',
            options: [
              'Pushing the pawn as fast as possible',
              'Getting the king AHEAD of the pawn',
              'Keeping the king behind the pawn',
              'Moving the pawn to the edge',
            ],
            correctIndex: 1,
            explanation: "King ahead of the pawn! The king clears the path and controls the promotion square. Pawn follows behind.",
          ),
          MascotSpeechStep(
            message: "King + Pawn endgames look simple but are deeply complex. Opposition mastery separates good from great players!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _squareRule => const Lesson(
        id: 'ch23_l4',
        title: 'The Square Rule',
        description: 'Can the king catch the pawn?',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "Quick trick: the SQUARE RULE tells you instantly if a king can catch a pawn!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/k7/8/8/7P/4K3 w - - 0 1',
            message: "Draw an imaginary square from the pawn to the 8th rank. If the enemy king can step INTO this square, it catches the pawn!",
            highlightSquares: ['h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'h8', 'g2', 'g3', 'g4', 'g5', 'g6', 'g7', 'g8'],
          ),
          MascotSpeechStep(
            message: "If the king is OUTSIDE the square, the pawn promotes! If it can enter the square on its turn, it catches the pawn.",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'White pawn on a2, black king on f7. Can the black king catch the pawn?',
            options: ['Yes', 'No, the pawn promotes'],
            correctIndex: 0,
            explanation: "Yes! The square goes from a2 to a8. The king on f7 can reach a7 in 5 moves. The pawn needs 6 moves to promote. King catches it!",
          ),
          MascotSpeechStep(
            message: "The square rule saves you from having to calculate every move. Just visualize the square!",
            emotion: 'happy',
          ),
        ],
      );
}
