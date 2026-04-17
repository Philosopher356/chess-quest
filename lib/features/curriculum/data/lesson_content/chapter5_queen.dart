import '../../domain/entities/lesson.dart';

/// Chapter 5: "Sir Hops' Training" — The Knight reveals his L-shape powers.
class Chapter5Content {
  static List<Lesson> get lessons => [
        _lShapeSecret,
        _jumpOverEverything,
        _knightTrail,
        _doubleTrouble,
      ];

  static Lesson get _lShapeSecret => const Lesson(
        id: 'ch5_l1',
        title: 'The L-Shape Secret',
        description: "Sir Hops reveals his power!",
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Okay, it's MY turn! I've been helping you this whole time but I never showed you how I ACTUALLY move. Ready?",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "I move in an L-shape! Two squares in one direction, then one square sideways. It's weird but POWERFUL!",
            emotion: 'explaining',
            fen: '8/8/8/8/4N3/8/8/8 w - - 0 1',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4N3/8/8/8 w - - 0 1',
            message: "See all the squares I can reach? That's the L-shape! Try moving me!",
            highlightSquares: ['d6', 'f6', 'c5', 'g5', 'c3', 'g3', 'd2', 'f2'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4N3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd6'), ('e4', 'f6'),
              ('e4', 'c5'), ('e4', 'g5'),
              ('e4', 'c3'), ('e4', 'g3'),
              ('e4', 'd2'), ('e4', 'f2'),
            ],
            hintMessage: "Jump me to any of the highlighted squares! L-shape!",
            successMessage: "BOING! That's the L-shape hop! See why they call me Sir HOPS?",
            showValidMoves: true,
          ),
          MascotSpeechStep(
            message: "From the center I can reach 8 squares. On the edge, only 2-4. That's why I love the center!",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _jumpOverEverything => const Lesson(
        id: 'ch5_l2',
        title: 'Jump Over Everything',
        description: "The knight's superpower!",
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Here's my REAL superpower. Every other piece gets blocked by things in the way. But I? I JUMP OVER THEM!",
            emotion: 'proud',
          ),
          ShowPositionStep(
            fen: '8/8/8/3PPP2/3PNP2/3PPP2/8/8 w - - 0 1',
            message: "I'm completely surrounded by pawns! But watch this — I can still move!",
            highlightSquares: ['d6', 'f6', 'c5', 'g5', 'c3', 'g3', 'd2', 'f2'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/3PPP2/3PNP2/3PPP2/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd6'), ('e4', 'f6'),
              ('e4', 'c5'), ('e4', 'g5'),
              ('e4', 'c3'), ('e4', 'g3'),
              ('e4', 'd2'), ('e4', 'f2'),
            ],
            hintMessage: "Jump right over the wall! Only knights can do this!",
            successMessage: "HA! Jumped right over! Nobody traps Sir Hops!",
          ),
          MascotSpeechStep(
            message:
                "Rooks, bishops, queens — they ALL get blocked. But not me! I leap over everything! I'm worth 3 pawns, same as the Bishop.",
            emotion: 'laughing',
          ),
        ],
      );

  static Lesson get _knightTrail => const Lesson(
        id: 'ch5_l3',
        title: 'The Knight Trail',
        description: 'Navigate the obstacle course!',
        xpReward: 30,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message:
                "Time for my obstacle course! Can you hop me to all the targets? Think in L-shapes!",
            emotion: 'excited',
          ),
          CaptureChallenge(
            fen: '8/2p5/8/5p2/8/2N5/8/6p1 w - - 0 1',
            targetMoves: 4,
            piece: 'N',
            message: "Hop to all the targets! Remember: L-shape!",
          ),
          MascotSpeechStep(
            message: "You mastered the L-shape! Now let me show you my DEADLIEST trick...",
            emotion: 'determined',
          ),
        ],
      );

  static Lesson get _doubleTrouble => const Lesson(
        id: 'ch5_l4',
        title: 'Double Trouble',
        description: 'Attack two at once!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "My ultimate move: the FORK! I can attack TWO enemy pieces at once! They can only save one!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '3qk3/8/8/8/8/5N2/8/4K3 w - - 0 1',
            message: "See the enemy king AND queen? There's ONE square where I attack BOTH...",
            arrows: [('f3', 'e5')],
            objectiveSquares: ['e5'],
          ),
          WaitForMoveStep(
            fen: '3qk3/8/8/8/8/5N2/8/4K3 w - - 0 1',
            acceptedMoves: [('f3', 'e5')],
            hintMessage: "Jump to e5 — you'll attack both the king and queen!",
            successMessage: "FORK! The king must move, and then I grab the queen! DEVASTATING!",
            failMessage: "Find the square where the knight attacks BOTH the king and queen!",
          ),
          MascotSpeechStep(
            message:
                "The Fork is one of the most powerful tricks in chess. They can only save one piece — the other is yours! Now let's find the King!",
            emotion: 'proud',
          ),
        ],
      );
}
