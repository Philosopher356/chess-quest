import '../../domain/entities/lesson.dart';

/// Chapter 15: Forks - attacking two pieces at once.
class Chapter15Content {
  static List<Lesson> get lessons => [
        _attackTwoAtOnce,
        _knightForks,
        _otherForks,
      ];

  static Lesson get _attackTwoAtOnce => const Lesson(
        id: 'ch15_l1',
        title: 'Attack Two at Once',
        description: 'The power of the fork!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "A FORK is when one piece attacks TWO or more enemy pieces at the same time! The opponent can only save one!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '3qk3/8/8/4N3/8/8/8/4K3 w - - 0 1',
            message:
                "This knight on e5 attacks BOTH the king on e8 and the queen on d8! The king must move, and then you capture the queen!",
            arrows: [('e5', 'd7'), ('e5', 'f7')],
            objectiveSquares: ['e8', 'd8'],
          ),
          MascotSpeechStep(
            message:
                "Forks work because your opponent can only make one move per turn. If two pieces are attacked, one gets saved, one gets captured!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message:
                "The ROYAL FORK is the most devastating - when a knight forks the king AND queen!",
            emotion: 'excited',
          ),
          QuizStep(
            question: 'What makes forks so powerful?',
            options: [
              "They look impressive",
              "The opponent can only save one piece per move",
              "They give check",
              "They always win the queen",
            ],
            correctIndex: 1,
            explanation:
                "The opponent can only move once! When two pieces are attacked, one will be lost!",
          ),
        ],
      );

  static Lesson get _knightForks => const Lesson(
        id: 'ch15_l2',
        title: 'Knight Forks',
        description: 'The knight is the fork master!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message:
                "Knights are the BEST at forking because they jump in unexpected L-shapes! Let's practice finding knight forks!",
            emotion: 'excited',
          ),
          // Fork king and queen
          WaitForMoveStep(
            fen: '2k1q3/8/8/8/3N4/8/8/4K3 w - - 0 1',
            acceptedMoves: [('d4', 'c6')],
            hintMessage: 'Find the square where the knight attacks both the king and queen!',
            successMessage: "FORK! The knight on c6 attacks the king AND queen!",
            failMessage: "Look for a knight square that attacks BOTH the king on c8 and queen on e7.",
          ),
          // Fork king and rook
          WaitForMoveStep(
            fen: 'r3k3/8/8/8/8/5N2/8/4K3 w - - 0 1',
            acceptedMoves: [('f3', 'd4')],
            hintMessage: 'Fork the king and rook! Where does the knight land?',
            successMessage: "FORK! Knight forks king and rook!",
            failMessage: "The knight needs to reach a square attacking both e8 (king) and a8 (rook).",
          ),
          // Fork queen and rook
          WaitForMoveStep(
            fen: 'r5q1/8/8/8/8/4N3/8/4K3 w - - 0 1',
            acceptedMoves: [('e3', 'f5')],
            hintMessage: 'Can the knight attack both the queen and rook?',
            successMessage: "FORK! The queen and rook can't both escape!",
          ),
          MascotSpeechStep(
            message:
                "Always scan for knight forks! They win material more than any other tactic!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _otherForks => const Lesson(
        id: 'ch15_l3',
        title: 'Other Forks',
        description: 'Any piece can fork!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Knights aren't the only forkers! Pawns, bishops, rooks, and queens can all fork too!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/2b1r3/8/3P4/8/8/8/4K3 w - - 0 1',
            message:
                "PAWN FORK! The d5 pawn attacks the bishop on c6 AND the rook on e6! Pawns fork sideways.",
            arrows: [('d5', 'c6'), ('d5', 'e6')],
            objectiveSquares: ['c7', 'e7'],
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/8/8/1Q6/4K3 w - - 0 1',
            message:
                "QUEEN FORK! The queen is incredible at forking because she attacks in every direction!",
            arrows: [('b2', 'b8'), ('b2', 'g7')],
          ),
          // Find the pawn fork
          WaitForMoveStep(
            fen: '8/8/2n1b3/8/3P4/8/8/4K3 w - - 0 1',
            acceptedMoves: [('d4', 'd5')],
            hintMessage: 'Push the pawn to fork the knight and bishop!',
            successMessage: "PAWN FORK! The little pawn attacks two bigger pieces!",
          ),
          QuizStep(
            question: 'Which piece is best at forking?',
            options: ['Pawn', 'Knight', 'Bishop', 'Any piece can fork!'],
            correctIndex: 3,
            explanation:
                "Any piece can fork! But knights are especially tricky because opponents often forget their L-shape reach.",
          ),
          MascotSpeechStep(
            message: "Always look for forks - they're the most common way to win material!",
            emotion: 'happy',
          ),
        ],
      );
}
