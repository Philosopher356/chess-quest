import '../../domain/entities/lesson.dart';

/// Chapter 2: The Pawns - movement, captures, first move.
class Chapter2Content {
  static List<Lesson> get lessons => [
        _braveSoldiers,
        _firstCharge,
        _capturingDiagonally,
        _pawnMaze,
      ];

  static Lesson get _braveSoldiers => const Lesson(
        id: 'ch2_l1',
        title: 'The Brave Soldiers',
        description: 'How pawns move forward',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "Let's meet the pawns! They're the little soldiers at the front of your army.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/PPPPPPPP/8 w - - 0 1',
            message:
                'Each side starts with 8 pawns. They stand in a line, ready to march forward!',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4P3/8/8/8 w - - 0 1',
            message:
                'A pawn moves forward one square at a time. It can only go straight ahead, never backward!',
            arrows: [('e4', 'e5')],
            highlightSquares: ['e5'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4P3/8/8/8 w - - 0 1',
            acceptedMoves: [('e4', 'e5')],
            hintMessage: 'Move the pawn forward one square!',
            successMessage: "Great! The pawn marched forward one step!",
            failMessage: "Pawns can only move straight forward!",
            highlightSquares: ['e5'],
          ),
          MascotSpeechStep(
            message:
                "See? Pawns are brave but slow - one step at a time! But wait, there's a special trick...",
            emotion: 'thinking',
          ),
        ],
      );

  static Lesson get _firstCharge => const Lesson(
        id: 'ch2_l2',
        title: 'The First Charge',
        description: 'The two-square opening move',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "Here's a secret: on its very FIRST move, a pawn can jump TWO squares forward!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/4P3/8 w - - 0 1',
            message:
                'This pawn is on its starting square. It can move one OR two squares forward!',
            highlightSquares: ['e3', 'e4'],
            arrows: [('e2', 'e3'), ('e2', 'e4')],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/8/8/4P3/8 w - - 0 1',
            acceptedMoves: [('e2', 'e4')],
            hintMessage: 'Try the big two-square jump! Move the pawn to e4!',
            successMessage:
                "Charge! The pawn jumped two squares on its first move!",
            failMessage: 'Try moving two squares forward this time!',
          ),
          MascotSpeechStep(
            message:
                "Remember: the two-square jump only works on the pawn's FIRST move. After that, one square only!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/8/8/3P4/8 w - - 0 1',
            acceptedMoves: [('d2', 'd3'), ('d2', 'd4')],
            hintMessage: 'Move this pawn forward - one or two squares!',
            successMessage: "Well done! You're getting the hang of it!",
          ),
        ],
      );

  static Lesson get _capturingDiagonally => const Lesson(
        id: 'ch2_l3',
        title: 'Capturing Diagonally',
        description: 'How pawns capture enemies',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Pawns move straight forward, but they capture DIAGONALLY! One square forward and to the side.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/3p1p2/4P3/8/8/8 w - - 0 1',
            message:
                "See the white pawn? It can capture either black pawn diagonally!",
            arrows: [('e4', 'd5'), ('e4', 'f5')],
            objectiveSquares: ['d5', 'f5'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/3p1p2/4P3/8/8/8 w - - 0 1',
            acceptedMoves: [('e4', 'd5'), ('e4', 'f5')],
            hintMessage: 'Capture one of the black pawns diagonally!',
            successMessage: "Excellent! You captured a pawn!",
            failMessage: 'Pawns capture diagonally forward, not straight!',
          ),
          ShowPositionStep(
            fen: '8/8/8/4p3/4P3/8/8/8 w - - 0 1',
            message:
                "But a pawn CANNOT capture straight ahead! If a piece blocks it, the pawn is stuck.",
            dangerSquares: ['e5'],
          ),
          QuizStep(
            question: 'How does a pawn capture?',
            options: [
              'Straight forward',
              'Diagonally forward',
              'Backward',
              'Sideways',
            ],
            correctIndex: 1,
            explanation:
                "Pawns capture diagonally forward - one square ahead and to the side!",
          ),
          MascotSpeechStep(
            message:
                "You've learned the pawn's three skills: march forward, charge two squares on first move, and capture diagonally!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _pawnMaze => const Lesson(
        id: 'ch2_l4',
        title: 'Pawn Maze',
        description: 'Navigate through the maze!',
        xpReward: 30,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message:
                "Time for a challenge! Guide your pawn from the bottom to the top of the board!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "Capture enemy pawns in your path and reach the other side! The fewer moves, the more stars!",
            emotion: 'explaining',
          ),
          // Maze 1: Simple path with one capture
          CaptureChallenge(
            fen: '8/8/8/3p4/8/8/4P3/8 w - - 0 1',
            targetMoves: 4,
            piece: 'P',
            message: 'Get the pawn to rank 8! Capture the enemy on the way!',
          ),
        ],
      );
}
