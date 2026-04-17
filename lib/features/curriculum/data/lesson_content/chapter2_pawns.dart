import '../../domain/entities/lesson.dart';

/// Chapter 2: "The Castle Towers" — Rescue villagers by breaking walls with the Rook.
/// (Was: The Pawns. Pawns are now covered in Chapter 1.)
class Chapter2Content {
  static List<Lesson> get lessons => [
        _breakingTheWalls,
        _rookRescueMission,
        _towerDefense,
      ];

  static Lesson get _breakingTheWalls => const Lesson(
        id: 'ch2_l1',
        title: 'Breaking the Walls',
        description: 'The rook smashes through!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "The Shadow built walls to trap the villagers! But see that piece in the corner? That's the ROOK — she's like a castle tower!",
            emotion: 'storytelling',
            fen: '8/8/8/8/p3R3/8/8/8 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "The Rook moves in straight lines — up, down, left, right — as far as she wants! She's a battering ram! Help her smash through!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/p3R3/8/8/8 w - - 0 1',
            message: "Move the rook to capture the enemy pawn! She slides along rows and columns!",
            arrows: [('e4', 'a4')],
            objectiveSquares: ['a4'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/p3R3/8/8/8 w - - 0 1',
            acceptedMoves: [('e4', 'a4')],
            hintMessage: "Slide the rook left along the row to capture the enemy!",
            successMessage: "CRASH! The wall is down! The Rook is incredible!",
            failMessage: "Rooks move in straight lines — up, down, left, or right!",
          ),
          MascotSpeechStep(
            message:
                "But remember — the Rook can't jump over things! She has to go AROUND obstacles. Not like me — I can jump! But we'll get to that later...",
            emotion: 'laughing',
          ),
        ],
      );

  static Lesson get _rookRescueMission => const Lesson(
        id: 'ch2_l2',
        title: 'Rook Rescue Mission',
        description: 'Save everyone!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "More villagers trapped behind enemy walls! Use the Rook to break ALL the walls. Try to do it in as few moves as possible!",
            emotion: 'determined',
          ),
          CaptureChallenge(
            fen: '8/4p3/8/8/p3R2p/8/8/8 w - - 0 1',
            targetMoves: 3,
            piece: 'R',
            message: "Capture all three enemy pawns with the Rook!",
          ),
          MascotSpeechStep(
            message:
                "All villagers rescued! The Rook is POWERFUL — she controls entire rows and columns. She's worth 5 pawns!",
            emotion: 'proud',
          ),
        ],
      );

  static Lesson get _towerDefense => const Lesson(
        id: 'ch2_l3',
        title: 'Tower Defense',
        description: 'Rook vs rook showdown!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Uh oh — the Shadow has its OWN rook! Time for a tower showdown! Capture the enemy rook before it captures you!",
            emotion: 'worried',
          ),
          ShowPositionStep(
            fen: '8/8/8/4r3/8/8/4R3/8 w - - 0 1',
            message: "Your white rook vs the black rook! Move straight up to capture it!",
            arrows: [('e2', 'e5')],
            objectiveSquares: ['e5'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/4r3/8/8/4R3/8 w - - 0 1',
            acceptedMoves: [('e2', 'e5')],
            hintMessage: "The enemy rook is on the same file — slide straight up!",
            successMessage: "BOOM! Your Rook wins the tower battle! She's on your team now!",
          ),
          MascotSpeechStep(
            message:
                "The Rook has joined our quest! Two down, four more pieces to find! Let's head into the Diagonal Forest!",
            emotion: 'excited',
          ),
        ],
      );
}
