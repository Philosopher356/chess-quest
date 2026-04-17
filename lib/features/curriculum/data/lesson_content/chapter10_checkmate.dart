import '../../domain/entities/lesson.dart';

/// Chapter 10: "The Checkmate Scrolls" — Famous checkmate patterns.
class Chapter10Content {
  static List<Lesson> get lessons => [
        _backRankAmbush,
        _scholarsTrick,
        _smotheredStrike,
      ];

  static Lesson get _backRankAmbush => const Lesson(
        id: 'ch10_l1',
        title: 'The Back Rank Ambush',
        description: 'Trapped by their own army!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "I found ancient scrolls with CHECKMATE PATTERNS! These are battle moves that end the game instantly! First: the Back Rank Ambush!",
            emotion: 'storytelling',
          ),
          ShowPositionStep(
            fen: '6k1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1',
            message: "The enemy King is trapped behind its OWN pawns! A rook on the back row means instant checkmate!",
            arrows: [('a1', 'a8')],
            dangerSquares: ['g8'],
          ),
          WaitForMoveStep(
            fen: '6k1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1',
            acceptedMoves: [('a1', 'a8')],
            hintMessage: "Slide the Rook to the back row! The king is trapped!",
            successMessage: "CHECKMATE! The King's own pawns trapped it! The Back Rank Ambush!",
          ),
          MascotSpeechStep(
            message: "Tip: make sure YOUR king has an escape square too! Push one pawn (like h3) to make a 'window' for your king!",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _scholarsTrick => const Lesson(
        id: 'ch10_l2',
        title: "The Scholar's Trick",
        description: 'A 4-move surprise!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "This scroll shows a 4-MOVE CHECKMATE! It's called Scholar's Mate — and it catches beginners all the time!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: 'r1bqkbnr/pppp1ppp/2n5/4p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1',
            message: "The Queen and Bishop BOTH aim at f7 — the weakest square! Qxf7 is checkmate!",
            arrows: [('h5', 'f7'), ('c4', 'f7')],
            dangerSquares: ['f7'],
          ),
          MascotSpeechStep(
            message: "BUT — if you know the defense, you can CRUSH this attack! Play Nf6 and the Queen has to retreat!",
            emotion: 'determined',
            fen: 'r1bqkb1r/pppp1ppp/2n2n2/4p2Q/2B1P3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1',
          ),
          QuizStep(
            question: "How do you defend against Scholar's Mate?",
            options: [
              "Move the King early",
              "Develop Nf6 — attacks the Queen AND develops!",
              "Push pawns on the kingside",
            ],
            correctIndex: 1,
            explanation: "Nf6! The knight defends f7, develops a piece, AND attacks the Queen. The attacker wasted time!",
          ),
        ],
      );

  static Lesson get _smotheredStrike => const Lesson(
        id: 'ch10_l3',
        title: "Sir Hops' Smothered Mate",
        description: "The ultimate knight move!",
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "This is MY scroll! The SMOTHERED MATE — the most beautiful checkmate in chess! Only a Knight can do it!",
            emotion: 'proud',
          ),
          ShowPositionStep(
            fen: '6rk/6pp/8/6N1/8/8/8/6K1 w - - 0 1',
            message: "The enemy King on h8 is boxed in by its own rook and pawns. The Knight delivers the final blow!",
            dangerSquares: ['h8'],
          ),
          WaitForMoveStep(
            fen: '6rk/6pp/8/6N1/8/8/8/6K1 w - - 0 1',
            acceptedMoves: [('g5', 'f7')],
            hintMessage: "The Knight checkmates from a square that attacks h8!",
            successMessage: "SMOTHERED MATE! The King is trapped by its own pieces! Sir Hops' ultimate move!",
          ),
          MascotSpeechStep(
            message: "That's why I'm the best! Nobody else can deliver a smothered mate — only the Knight can jump in for the kill!",
            emotion: 'laughing',
          ),
        ],
      );
}
