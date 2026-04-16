import '../../domain/entities/lesson.dart';

/// Chapter 14: Opening Principles - center control, development, castling.
class Chapter14Content {
  static List<Lesson> get lessons => [
        _controlTheCenter,
        _developYourPieces,
        _castleEarly,
        _openingExplorer,
      ];

  static Lesson get _controlTheCenter => const Lesson(
        id: 'ch14_l1',
        title: 'Control the Center',
        description: 'The most important squares',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Welcome to strategy! The first rule of the opening: CONTROL THE CENTER!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
            message:
                "The four center squares (d4, d5, e4, e5) are the most important on the board!",
            objectiveSquares: ['d4', 'd5', 'e4', 'e5'],
          ),
          MascotSpeechStep(
            message:
                "Pieces in the center control MORE squares than pieces on the edge. A knight on e4 reaches 8 squares; on a1 only 2!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',
            message:
                "1.e4 - One of the best first moves! The pawn grabs center space and opens lines for the bishop and queen.",
            arrows: [('e4', 'd5'), ('e4', 'f5')],
            highlightSquares: ['e4'],
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/3P4/8/PPP1PPPP/RNBQKBNR b KQkq d3 0 1',
            message:
                "1.d4 - Equally strong! Controls the center and opens the bishop's diagonal.",
            highlightSquares: ['d4'],
          ),
          WaitForMoveStep(
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
            acceptedMoves: [('e2', 'e4'), ('d2', 'd4')],
            hintMessage: 'Start the game by controlling the center! Play e4 or d4!',
            successMessage: "Great opening move! You're claiming the center!",
            failMessage: "Try e4 or d4 - grab the center on move 1!",
          ),
          QuizStep(
            question: 'Why is the center important?',
            options: [
              "It looks cool",
              "Pieces control more squares from the center",
              "The king is safer there",
              "It's closer to the opponent",
            ],
            correctIndex: 1,
            explanation:
                "Pieces control more squares from the center! A centralized piece is more active and powerful.",
          ),
          MascotSpeechStep(
            message: "Always fight for the center in the opening!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _developYourPieces => const Lesson(
        id: 'ch14_l2',
        title: 'Develop Your Pieces',
        description: 'Get your army into battle!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Rule 2: DEVELOP YOUR PIECES! Get your knights and bishops off the back rank quickly.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'r1bqkb1r/pppppppp/2n2n2/8/4P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 0 1',
            message:
                "Good development! Both knights are out, controlling the center. Now the bishops should come out too.",
            highlightSquares: ['f3', 'c6', 'f6'],
          ),
          MascotSpeechStep(
            message:
                "Development tips:\n- Knights before bishops (usually)\n- Don't move the same piece twice\n- Don't bring the queen out too early\n- Connect your rooks",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
            message:
                "BAD opening: moving the same piece multiple times or pushing random pawns wastes tempo!",
          ),
          QuizStep(
            question: 'Which piece should you usually develop first?',
            options: ['Queen', 'Rook', 'Knights', 'King'],
            correctIndex: 2,
            explanation:
                "Knights! They can jump over pawns and help control the center immediately. Knights before bishops, both before queen!",
          ),
          QuizStep(
            question: 'Why is developing the queen early usually bad?',
            options: [
              "The queen is too strong",
              "The queen can be chased by weaker pieces, wasting moves",
              "The queen should protect the king",
              "There's no room for the queen",
            ],
            correctIndex: 1,
            explanation:
                "If the queen comes out early, your opponent can develop pieces while attacking her, gaining tempo!",
          ),
          MascotSpeechStep(
            message: "Get all your pieces into the game quickly!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _castleEarly => const Lesson(
        id: 'ch14_l3',
        title: 'Castle Early!',
        description: 'Protect your king quickly',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Rule 3: CASTLE EARLY! Get your king to safety before attacking.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'r1bqk2r/pppp1ppp/2n2n2/2b1p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 0 1',
            message:
                "White is ready to castle kingside! The knight and bishop have moved out of the way.",
            arrows: [('e1', 'g1')],
            highlightSquares: ['f1', 'g1'],
          ),
          ShowPositionStep(
            fen: 'r1bqk2r/pppp1ppp/2n2n2/2b1p3/2B1P3/5N2/PPPP1PPP/RNBQ1RK1 b kq - 0 1',
            message:
                "After castling, the king is tucked behind pawns (safe!) and the rook is now active toward the center!",
            highlightSquares: ['g1', 'f1'],
          ),
          ShowPositionStep(
            fen: 'rnbqk2r/pppp1ppp/5n2/4p3/2B1P3/5Q2/PPPP1PPP/RNB1K2R b KQkq - 0 1',
            message:
                "Warning: if you don't castle, the center can open up and your king gets attacked!",
            dangerSquares: ['e8'],
          ),
          QuizStep(
            question: 'When should you usually castle?',
            options: [
              'As late as possible',
              'Within the first 10 moves',
              'Only when attacked',
              'Never, the king is fine in the center',
            ],
            correctIndex: 1,
            explanation:
                "Castle within the first 10 moves! The sooner your king is safe, the sooner you can attack freely.",
          ),
          MascotSpeechStep(
            message:
                "The three rules: 1) Control the center 2) Develop pieces 3) Castle early. Follow these and you'll have a great opening!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _openingExplorer => const Lesson(
        id: 'ch14_l4',
        title: 'Opening Explorer',
        description: 'Famous openings to try',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Let me show you some famous openings that follow our principles!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: 'r1bqkb1r/pppp1ppp/2n2n2/4p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 0 1',
            message:
                "The ITALIAN GAME: 1.e4 e5 2.Nf3 Nc6 3.Bc4 - White develops naturally and aims at f7, the weakest square!",
            arrows: [('c4', 'f7')],
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/ppp1pppp/8/3p4/3PP3/8/PPP2PPP/RNBQKBNR b KQkq - 0 1',
            message:
                "The QUEEN'S GAMBIT: 1.d4 d5 2.c4 - White offers a pawn to gain center control. Very solid!",
            highlightSquares: ['c4', 'd4'],
          ),
          ShowPositionStep(
            fen: 'rnbqkb1r/pppppppp/5n2/8/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1',
            message:
                "The LONDON SYSTEM: 1.d4 Nf6 2.Bf4 - Easy to learn and very reliable. White develops the bishop early!",
          ),
          MascotSpeechStep(
            message:
                "Don't memorize moves - understand the IDEAS! Center, develop, castle. Any opening that does those three things is good!",
            emotion: 'happy',
          ),
        ],
      );
}
