import '../../domain/entities/lesson.dart';

/// Chapter 11: "Battle Formations" — Opening principles as battle strategy.
class Chapter11Content {
  static List<Lesson> get lessons => [
        _seizeTheCenter,
        _deployForces,
        _shieldTheKing,
        _famousFormations,
      ];

  static Lesson get _seizeTheCenter => const Lesson(
        id: 'ch11_l1',
        title: 'Seize the Center',
        description: 'Control the heart of the board!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Every great battle starts with the CENTER! The four center squares are the most powerful positions on the board!",
            emotion: 'storytelling',
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
            message: "These four squares are the HIGH GROUND! Whoever controls them controls the battle!",
            objectiveSquares: ['d4', 'd5', 'e4', 'e5'],
          ),
          WaitForMoveStep(
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
            acceptedMoves: [('e2', 'e4'), ('d2', 'd4')],
            hintMessage: "Claim the center! Move a pawn to e4 or d4!",
            successMessage: "You seized the center! That's how battles begin!",
            failMessage: "Start with e4 or d4 — claim the high ground!",
          ),
          MascotSpeechStep(
            message: "Pieces in the center control MORE squares. A knight in the center reaches 8 squares. On the edge? Only 2-4!",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _deployForces => const Lesson(
        id: 'ch11_l2',
        title: 'Deploy Your Forces',
        description: 'Get everyone fighting!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "Rule two of battle: get ALL your pieces into the fight FAST! An army sitting on the back row is useless!",
            emotion: 'determined',
          ),
          MascotSpeechStep(
            message: "Development order:\n1. Center pawns first\n2. Knights before bishops\n3. DON'T move the Queen early (she gets chased!)\n4. Connect your Rooks!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "Why is bringing the Queen out early usually bad?",
            options: [
              "The Queen is too strong",
              "Enemies chase her with weaker pieces, gaining time",
              "There's no room for her",
            ],
            correctIndex: 1,
            explanation: "The enemy develops while attacking your Queen! They gain speed while you waste moves retreating!",
          ),
          MascotSpeechStep(
            message: "Get knights and bishops out first. Save the Queen for later. Fast development wins games!",
            emotion: 'proud',
          ),
        ],
      );

  static Lesson get _shieldTheKing => const Lesson(
        id: 'ch11_l3',
        title: 'Shield the King',
        description: 'Castle early!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "Rule three: CASTLE EARLY! Tuck the King behind pawns before launching your attack!",
            emotion: 'worried',
          ),
          ShowPositionStep(
            fen: 'r1bqk2r/pppp1ppp/2n2n2/2b1p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 0 1',
            message: "White is ready to castle! The knight and bishop cleared the path. Castle and the King is safe!",
            arrows: [('e1', 'g1')],
          ),
          MascotSpeechStep(
            message: "Three rules of battle:\n1. Seize the center\n2. Deploy your forces\n3. Castle early!\n\nFollow these and you'll win more games than you lose!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _famousFormations => const Lesson(
        id: 'ch11_l4',
        title: 'Famous Formations',
        description: 'Openings the masters use!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Let me show you some famous battle formations that follow our three rules!",
            emotion: 'storytelling',
          ),
          ShowPositionStep(
            fen: 'r1bqkb1r/pppp1ppp/2n2n2/4p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 0 1',
            message: "The ITALIAN GAME: e4, Nf3, Bc4 — aims at the weak f7 square! Classic attack!",
            arrows: [('c4', 'f7')],
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/ppp1pppp/8/3p4/3PP3/8/PPP2PPP/RNBQKBNR b KQkq - 0 1',
            message: "The QUEEN'S GAMBIT: d4, c4 — offer a pawn for center control! Very strategic!",
            highlightSquares: ['c4', 'd4'],
          ),
          MascotSpeechStep(
            message: "Don't memorize moves — understand the IDEAS! Center, develop, castle. Any formation that does those three things is strong!",
            emotion: 'explaining',
          ),
        ],
      );
}
