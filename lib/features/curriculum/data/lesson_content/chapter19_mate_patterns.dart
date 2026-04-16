import '../../domain/entities/lesson.dart';

/// Chapter 19: Checkmate Patterns.
class Chapter19Content {
  static List<Lesson> get lessons => [
        _backRankMate,
        _scholarsMate,
        _smotheredMate,
        _patternDrill,
      ];

  static Lesson get _backRankMate => const Lesson(
        id: 'ch19_l1',
        title: 'Back Rank Mate',
        description: 'Trapped on the back row!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "The BACK RANK MATE is one of the most common checkmate patterns! Let's learn to spot it AND prevent it!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '6k1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1',
            message:
                "See how the black king is trapped by its own pawns on g7, h7, f7? A rook on the back rank = checkmate!",
            dangerSquares: ['g8'],
            arrows: [('a1', 'a8')],
          ),
          WaitForMoveStep(
            fen: '6k1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1',
            acceptedMoves: [('a1', 'a8')],
            hintMessage: 'Deliver back rank mate!',
            successMessage: "CHECKMATE! The king is trapped by its own pawns!",
          ),
          MascotSpeechStep(
            message:
                "Prevention tip: create a 'luft' (escape square) by pushing one pawn (like h3 or g3) to give your king an escape!",
            emotion: 'explaining',
            fen: '6k1/5pp1/7p/8/8/7P/5PP1/6K1 w - - 0 1',
          ),
          MascotSpeechStep(
            message: "Always check: is MY back rank safe? Can my opponent deliver a back rank mate?",
            emotion: 'thinking',
          ),
        ],
      );

  static Lesson get _scholarsMate => const Lesson(
        id: 'ch19_l2',
        title: "Scholar's Mate",
        description: 'The famous 4-move trap!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Scholar's Mate is a 4-move checkmate that catches many beginners! Let me show you the trap AND the defense!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1',
            message: "1. e4 e5 - Both sides grab the center.",
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppp1ppp/8/4p3/2B1P3/8/PPPP1PPP/RNBQK1NR b KQkq - 0 1',
            message: "2. Bc4 - The bishop aims at f7, the weakest square (only the king defends it).",
            arrows: [('c4', 'f7')],
            dangerSquares: ['f7'],
          ),
          ShowPositionStep(
            fen: 'r1bqkbnr/pppp1ppp/2n5/4p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR b KQkq - 0 1',
            message: "3. Qh5 - The queen also targets f7. Now TWO pieces aim at f7!",
            arrows: [('h5', 'f7'), ('c4', 'f7')],
          ),
          ShowPositionStep(
            fen: 'r1bqkbnr/pppp1Qpp/2n5/4p3/2B1P3/8/PPPP1PPP/RNB1K1NR b KQkq - 0 1',
            message: "4. Qxf7# - CHECKMATE! The queen captures on f7 with the bishop supporting. Game over in 4 moves!",
            dangerSquares: ['e8'],
          ),
          MascotSpeechStep(
            message: "Now the DEFENSE! If your opponent tries this, here's how to stop it:",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'r1bqkb1r/pppp1ppp/2n2n2/4p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1',
            message:
                "Develop Nf6! The knight defends e5 AND attacks the queen! White wasted time with the early queen and now must retreat.",
            highlightSquares: ['f6'],
            arrows: [('f6', 'h5'), ('f6', 'e4')],
          ),
          QuizStep(
            question: "How do you defend against Scholar's Mate?",
            options: [
              "Move the king early",
              "Develop Nf6 to attack the queen and defend",
              "Push pawns on the kingside",
              "Move the queen out too",
            ],
            correctIndex: 1,
            explanation:
                "Nf6! The knight defends AND develops AND attacks the queen. The attacker wasted time with the early queen.",
          ),
        ],
      );

  static Lesson get _smotheredMate => const Lesson(
        id: 'ch19_l3',
        title: 'Smothered Mate',
        description: 'The knight strikes!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message:
                "SMOTHERED MATE is a beautiful checkmate where the knight delivers mate because the king is surrounded by its OWN pieces!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '6rk/6pp/8/6N1/8/8/8/6K1 w - - 0 1',
            message:
                "The black king on h8 is smothered by its own rook on g8 and pawns on g7/h7. The knight on g5 can deliver mate!",
            dangerSquares: ['h8'],
          ),
          WaitForMoveStep(
            fen: '6rk/6pp/8/6N1/8/8/8/6K1 w - - 0 1',
            acceptedMoves: [('g5', 'f7')],
            hintMessage: 'The knight checkmates from a square where it attacks h8!',
            successMessage: "SMOTHERED MATE! The knight checkmates and the king has nowhere to go!",
            failMessage: "Find the knight square that attacks h8. The king can't escape because its own pieces block it!",
          ),
          MascotSpeechStep(
            message:
                "The smothered mate is one of the most beautiful patterns in chess! It shows the knight's unique power.",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _patternDrill => const Lesson(
        id: 'ch19_l4',
        title: 'Pattern Drill',
        description: 'Name that pattern!',
        xpReward: 30,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message: "Quick! Can you identify these checkmate patterns?",
            emotion: 'excited',
          ),
          QuizStep(
            question: 'King trapped by own pawns, rook or queen checkmates on the back rank.',
            options: ['Smothered Mate', 'Back Rank Mate', "Scholar's Mate", 'Stalemate'],
            correctIndex: 1,
            explanation: "Back Rank Mate! The king's own pawns are its prison.",
            fen: '3R2k1/5ppp/8/8/8/8/8/6K1 w - - 0 1',
          ),
          QuizStep(
            question: 'Knight delivers checkmate with the king completely surrounded by friendly pieces.',
            options: ['Back Rank Mate', "Scholar's Mate", 'Smothered Mate', 'Pin Mate'],
            correctIndex: 2,
            explanation: "Smothered Mate! Only the knight can deliver it because it jumps!",
            fen: '5Nrk/6pp/8/8/8/8/8/6K1 w - - 0 1',
          ),
          QuizStep(
            question: '4-move checkmate targeting the weak f7 square with queen and bishop.',
            options: ["Scholar's Mate", 'Smothered Mate', 'Back Rank Mate', "Fool's Mate"],
            correctIndex: 0,
            explanation: "Scholar's Mate! Bc4 + Qh5 + Qxf7#. Remember: Nf6 defends!",
          ),
          MascotSpeechStep(
            message: "You've completed The Strategist! You now know real chess tactics! Time for advanced strategy!",
            emotion: 'happy',
          ),
        ],
      );
}
