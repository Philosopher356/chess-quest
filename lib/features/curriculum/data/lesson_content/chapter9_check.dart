import '../../domain/entities/lesson.dart';

/// Chapter 9: "The Shadow Trap" — Stalemate and draws.
class Chapter9Content {
  static List<Lesson> get lessons => [
        _nobodyWins,
        _dontLetThemEscape,
      ];

  static Lesson get _nobodyWins => const Lesson(
        id: 'ch9_l1',
        title: 'Nobody Wins',
        description: 'The stalemate trap!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "The Shadow set a TRAP! Sometimes when you're winning, the enemy has NO moves but ISN'T in check. That's called STALEMATE — and it's a DRAW! Nobody wins!",
            emotion: 'worried',
          ),
          ShowPositionStep(
            fen: 'k7/8/1K6/8/8/8/8/7Q w - - 0 1',
            message: "Watch — if the Queen goes to h7, the black King has NO legal moves but ISN'T in check!",
          ),
          ShowPositionStep(
            fen: 'k7/7Q/1K6/8/8/8/8/8 b - - 0 1',
            message: "STALEMATE! The King isn't attacked, but every square around it IS attacked. Draw!",
            dangerSquares: ['a7', 'b7', 'b8'],
          ),
          MascotSpeechStep(
            message: "The Shadow WANTS stalemate when it's losing! Don't let it escape with a draw — that's its trap!",
            emotion: 'determined',
          ),
        ],
      );

  static Lesson get _dontLetThemEscape => const Lesson(
        id: 'ch9_l2',
        title: "Don't Let Them Escape",
        description: 'Avoid the draw!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Before every move, ask: does my opponent have ANY legal move? If not and they're not in check — stalemate!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "White Queen on f7, White King on f5, Black King on h8. Should white play Qg7?",
            options: ['Yes, it gives checkmate!', 'No, it causes stalemate!'],
            correctIndex: 1,
            explanation: "Stalemate! After Qg7, the black King on h8 isn't in check but has NO legal moves. Careful!",
            fen: '7k/5Q2/8/5K2/8/8/8/8 w - - 0 1',
          ),
          QuizStep(
            question: "White Queen on h6, White King on f6, Black King on h8. Should white play Qg7?",
            options: ['Yes, it gives checkmate!', 'No, it causes stalemate!'],
            correctIndex: 0,
            explanation: "CHECKMATE! The Queen on g7 attacks h8 and the King has no escape! THIS one is mate!",
            fen: '7k/8/5K1Q/8/8/8/8/8 w - - 0 1',
          ),
          MascotSpeechStep(
            message: "The difference between checkmate and stalemate is ONE square! Always double-check!",
            emotion: 'proud',
          ),
        ],
      );
}
