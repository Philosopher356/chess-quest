import '../../domain/entities/lesson.dart';

/// Chapter 3: The Rook - straight-line movement, captures.
class Chapter3Content {
  static List<Lesson> get lessons => [
        _castleTower,
        _rookCaptureMission,
        _rookVsRook,
      ];

  static Lesson get _castleTower => const Lesson(
        id: 'ch3_l1',
        title: 'The Castle Tower',
        description: 'Rooks move in straight lines',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                "Meet the Rook! It looks like a castle tower and it's very powerful!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4R3/8/8/8 w - - 0 1',
            message:
                'The rook moves in straight lines - up, down, left, or right. As far as it wants!',
            arrows: [
              ('e4', 'e8'),
              ('e4', 'e1'),
              ('e4', 'a4'),
              ('e4', 'h4'),
            ],
            highlightSquares: [
              'e1', 'e2', 'e3', 'e5', 'e6', 'e7', 'e8',
              'a4', 'b4', 'c4', 'd4', 'f4', 'g4', 'h4',
            ],
          ),
          MascotSpeechStep(
            message:
                "The rook is like a train on rails - it goes forward, backward, or sideways but NEVER diagonally!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4R3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'e8'), ('e4', 'e7'), ('e4', 'e6'), ('e4', 'e5'),
              ('e4', 'e3'), ('e4', 'e2'), ('e4', 'e1'),
              ('e4', 'a4'), ('e4', 'b4'), ('e4', 'c4'), ('e4', 'd4'),
              ('e4', 'f4'), ('e4', 'g4'), ('e4', 'h4'),
            ],
            hintMessage: 'Move the rook along a rank or file!',
            successMessage: "The rook zooms across the board!",
            showValidMoves: true,
          ),
          ShowPositionStep(
            fen: '8/8/8/8/2P1R3/8/8/8 w - - 0 1',
            message:
                "But the rook can't jump over pieces! This pawn is blocking its path to the left.",
            arrows: [('e4', 'c4')],
            dangerSquares: ['c4'],
            highlightSquares: ['d4'],
          ),
          MascotSpeechStep(
            message:
                "Remember: rooks are powerful because they control entire rows and columns!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _rookCaptureMission => const Lesson(
        id: 'ch3_l2',
        title: 'Rook Capture Mission',
        description: 'Capture all the targets!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Time for a capture mission! Use the rook to capture all the black pawns!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "Try to capture them all in as few moves as possible for more stars!",
            emotion: 'explaining',
          ),
          CaptureChallenge(
            fen: '8/4p3/8/8/p3R2p/8/8/8 w - - 0 1',
            targetMoves: 3,
            piece: 'R',
            message: 'Capture all 3 black pawns with the rook!',
          ),
        ],
      );

  static Lesson get _rookVsRook => const Lesson(
        id: 'ch3_l3',
        title: 'Rook vs Rook',
        description: 'Your first piece battle!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Now let's learn something cool: a rook can capture enemy pieces that are in its path!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/4r3/8/8/4R3/8 w - - 0 1',
            message:
                "Your white rook can capture the black rook by moving straight up!",
            arrows: [('e2', 'e5')],
            objectiveSquares: ['e5'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/4r3/8/8/4R3/8 w - - 0 1',
            acceptedMoves: [('e2', 'e5')],
            hintMessage: 'Capture the black rook by moving to its square!',
            successMessage: "Captured! Your rook took the enemy rook!",
            failMessage: 'Move your rook to the square where the black rook is!',
          ),
          QuizStep(
            question: 'What is the value of a rook?',
            options: ['1 point', '3 points', '5 points', '9 points'],
            correctIndex: 2,
            explanation:
                "A rook is worth 5 points! It's one of the most powerful pieces.",
          ),
          MascotSpeechStep(
            message:
                "Rooks are powerful! They're worth 5 points. You'll use them a lot in your chess games!",
            emotion: 'happy',
          ),
        ],
      );
}
