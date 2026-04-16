import '../../domain/entities/lesson.dart';

/// Chapter 20: Pawn Structure.
class Chapter20Content {
  static List<Lesson> get lessons => [
        _strongAndWeak,
        _pawnChains,
      ];

  static Lesson get _strongAndWeak => const Lesson(
        id: 'ch20_l1',
        title: 'Strong & Weak Pawns',
        description: 'Isolated, doubled, backward, passed',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Pawns are the soul of chess! Their structure determines the whole game's character.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/pp1p1ppp/8/2P5/8/8/PP3PPP/8 w - - 0 1',
            message: "ISOLATED PAWN: The c5 pawn has no friendly pawns on adjacent files (b or d). It must be defended by pieces, which ties them down.",
            dangerSquares: ['c5'],
          ),
          ShowPositionStep(
            fen: '8/pp3ppp/3p4/3P4/3P4/8/PP3PPP/8 w - - 0 1',
            message: "DOUBLED PAWNS: Two pawns on the same file (d4 and d5). They can't protect each other and one blocks the other!",
            dangerSquares: ['d4', 'd5'],
          ),
          ShowPositionStep(
            fen: '8/8/8/3pp3/2P5/8/8/8 w - - 0 1',
            message: "BACKWARD PAWN: The c4 pawn can't advance safely because d5 controls c5. The enemy pawns hold it back!",
            dangerSquares: ['c4'],
            arrows: [('d5', 'c4')],
          ),
          ShowPositionStep(
            fen: '8/8/8/3P4/8/8/8/8 w - - 0 1',
            message: "PASSED PAWN: No enemy pawns can stop this pawn from promoting! It's a huge advantage in endgames!",
            objectiveSquares: ['d5'],
            arrows: [('d5', 'd8')],
          ),
          QuizStep(
            question: 'Which pawn type is strongest in an endgame?',
            options: ['Isolated pawn', 'Doubled pawn', 'Backward pawn', 'Passed pawn'],
            correctIndex: 3,
            explanation: "A passed pawn! With no enemy pawns to block it, a passed pawn can march to promotion!",
          ),
          MascotSpeechStep(
            message: "Learn to create passed pawns and avoid weak pawns!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _pawnChains => const Lesson(
        id: 'ch20_l2',
        title: 'Pawn Chains',
        description: 'Attack the base!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "A PAWN CHAIN is a diagonal line of pawns protecting each other. The key weakness is the BASE - the pawn at the bottom!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/4p3/3p4/2P5/1P6/P7/8 w - - 0 1',
            message: "White chain: a2-b3-c4. Black chain: d5-e6. To attack a chain, attack the BASE (a2 for white, d5 for black)!",
            arrows: [('a2', 'b3'), ('b3', 'c4')],
            highlightSquares: ['a2', 'b3', 'c4'],
            dangerSquares: ['a2'],
          ),
          MascotSpeechStep(
            message: "The tip of the chain is the strongest part. The base is the weakest. Always attack the base!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'How should you attack a pawn chain?',
            options: [
              'Attack the front pawn (tip)',
              'Attack the base pawn',
              'Ignore the pawns and attack elsewhere',
              'Push your own pawns forward',
            ],
            correctIndex: 1,
            explanation: "Attack the base! If the base falls, the whole chain collapses like dominoes!",
          ),
          MascotSpeechStep(
            message: "Understanding pawn structure separates intermediate players from advanced ones!",
            emotion: 'happy',
          ),
        ],
      );
}
