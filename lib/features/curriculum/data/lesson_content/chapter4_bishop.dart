import '../../domain/entities/lesson.dart';

/// Chapter 4: "Her Majesty" — Rescue the Queen from the Shadow's dungeon.
class Chapter4Content {
  static List<Lesson> get lessons => [
        _capturedQueen,
        _queensWrath,
        _royalRampage,
      ];

  static Lesson get _capturedQueen => const Lesson(
        id: 'ch4_l1',
        title: 'The Captured Queen',
        description: 'Free the most powerful piece!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "The Queen is locked in the Shadow's dungeon! She's the MOST POWERFUL piece — she moves like a Rook AND a Bishop combined!",
            emotion: 'worried',
          ),
          ShowPositionStep(
            fen: '8/8/3p1p2/8/3pQp2/8/3p1p2/8 w - - 0 1',
            message: "The Queen is surrounded by guards! She can go straight OR diagonal — help her break free!",
            arrows: [('e4', 'e8'), ('e4', 'a4'), ('e4', 'h7'), ('e4', 'b1')],
          ),
          WaitForMoveStep(
            fen: '8/8/3p1p2/8/3pQp2/8/3p1p2/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd5'), ('e4', 'f5'), ('e4', 'd3'), ('e4', 'f3'),
              ('e4', 'd4'), ('e4', 'f4'), ('e4', 'e5'), ('e4', 'e3'),
              ('e4', 'c6'), ('e4', 'g6'), ('e4', 'c2'), ('e4', 'g2'),
            ],
            hintMessage: "The Queen goes ANY direction! Capture a guard!",
            successMessage: "The Queen smashes through! She's unstoppable!",
          ),
          MascotSpeechStep(
            message:
                "The Queen is FREE! She's worth 9 pawns — more than any other piece! NEVER trade her for something small!",
            emotion: 'proud',
          ),
        ],
      );

  static Lesson get _queensWrath => const Lesson(
        id: 'ch4_l2',
        title: "The Queen's Wrath",
        description: 'She goes everywhere!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "The Queen is FURIOUS about being captured! Watch her power — she controls the entire board from the center!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/3Q4/8/8/8/8 w - - 0 1',
            message: "From the center, the Queen attacks 27 squares! Straight lines AND diagonals!",
            highlightSquares: [
              'd1', 'd2', 'd3', 'd4', 'd6', 'd7', 'd8',
              'a5', 'b5', 'c5', 'e5', 'f5', 'g5', 'h5',
              'c6', 'b7', 'a8', 'e6', 'f7', 'g8',
              'c4', 'b3', 'a2', 'e4', 'f3', 'g2', 'h1',
            ],
          ),
          MascotSpeechStep(
            message:
                "She's like a Rook and Bishop fused together! But be careful — if you lose her, it's a HUGE loss!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "Why is the Queen so powerful?",
            options: [
              "She can jump over pieces",
              "She moves like a Rook AND Bishop combined",
              "She can move twice per turn",
            ],
            correctIndex: 1,
            explanation: "The Queen combines the Rook's straight lines with the Bishop's diagonals. She's the ultimate piece!",
          ),
        ],
      );

  static Lesson get _royalRampage => const Lesson(
        id: 'ch4_l3',
        title: 'Royal Rampage',
        description: 'Nothing can stop her!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Time for the Queen's revenge! Help her wipe out ALL the Shadow's guards!",
            emotion: 'determined',
          ),
          CaptureChallenge(
            fen: '3p4/8/8/p3Q2p/8/8/8/4p3 w - - 0 1',
            targetMoves: 4,
            piece: 'Q',
            message: "Capture all 4 enemies with the Queen! She can go anywhere!",
          ),
          MascotSpeechStep(
            message:
                "INCREDIBLE! The Queen has joined us! Now there's only one piece left to train... ME!",
            emotion: 'excited',
          ),
        ],
      );
}
