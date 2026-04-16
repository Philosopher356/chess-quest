import '../../domain/entities/lesson.dart';

/// Chapter 27: Pattern Recognition Master.
class Chapter27Content {
  static List<Lesson> get lessons => [
        _patternMaster,
      ];

  static Lesson get _patternMaster => const Lesson(
        id: 'ch27_l1',
        title: 'Pattern Master',
        description: '500+ tactical patterns!',
        xpReward: 40,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message: "Pattern recognition is the #1 skill that separates masters from amateurs! The more patterns you know, the faster you spot tactics!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "This is your training ground! Solve puzzles every day. Start with easy ones and work your way up. Speed comes with practice!",
            emotion: 'explaining',
          ),
          // Mixed tactical patterns
          WaitForMoveStep(
            fen: 'r1bq1rk1/pppp1ppp/2n2n2/2b1p3/2B1P3/3P1N2/PPP2PPP/RNBQ1RK1 w - - 0 1',
            acceptedMoves: [('c4', 'f7')],
            hintMessage: "Look for a sacrifice on the weakest square!",
            successMessage: "Bxf7+! Attacking the weak f7 square - a classic tactical pattern!",
          ),
          WaitForMoveStep(
            fen: 'r1bqk2r/pppp1ppp/2n5/2b1p2Q/2B1n3/8/PPPP1PPP/RNB1K1NR w KQkq - 0 1',
            acceptedMoves: [('h5', 'f7')],
            hintMessage: "The queen and bishop both attack the same square...",
            successMessage: "Qxf7#! Checkmate! The classic Scholar's Mate pattern!",
          ),
          WaitForMoveStep(
            fen: '6k1/5ppp/8/8/8/8/6PP/2R3K1 w - - 0 1',
            acceptedMoves: [('c1', 'c8')],
            hintMessage: "Back rank! Is the king trapped?",
            successMessage: "Rc8#! Back rank checkmate - the pawns trap their own king!",
          ),
          MascotSpeechStep(
            message: "The more puzzles you solve, the faster you'll spot these patterns in real games! Head to the Puzzle section to train daily!",
            emotion: 'happy',
          ),
        ],
      );
}
