import '../../domain/entities/lesson.dart';

/// Chapter 11: Stalemate and Draws.
class Chapter11Content {
  static List<Lesson> get lessons => [
        _nobodyWins,
        _avoidStalemate,
      ];

  static Lesson get _nobodyWins => const Lesson(
        id: 'ch11_l1',
        title: 'Nobody Wins',
        description: 'When no moves are legal',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Sometimes chess ends in a DRAW - nobody wins! The most common way is called STALEMATE.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'k7/8/1K6/8/8/8/8/7Q w - - 0 1',
            message:
                "Watch what happens if white plays Qh7 here... oops!",
          ),
          ShowPositionStep(
            fen: 'k7/7Q/1K6/8/8/8/8/8 b - - 0 1',
            message:
                "STALEMATE! The black king is NOT in check, but has NO legal moves! Every square around it is attacked.",
            dangerSquares: ['a7', 'b7', 'b8'],
          ),
          MascotSpeechStep(
            message:
                "Stalemate = NOT in check + NO legal moves = DRAW! It's not checkmate because the king isn't attacked.",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message:
                "Other draws: if both sides have only a king (no pieces left to checkmate), the same position repeats 3 times, or 50 moves pass with no captures or pawn moves.",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Stalemate happens when...',
            options: [
              'The king is in check with no escape',
              'The king is NOT in check but has no legal moves',
              'Both players agree to stop',
              'A player runs out of time',
            ],
            correctIndex: 1,
            explanation:
                "Stalemate = NOT in check + no legal moves. If it WERE in check with no escape, that would be checkmate!",
          ),
        ],
      );

  static Lesson get _avoidStalemate => const Lesson(
        id: 'ch11_l2',
        title: 'Avoid the Stalemate',
        description: "Don't let them escape!",
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "When you're winning, be careful NOT to stalemate your opponent! You want checkmate, not a draw!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'White has queen on h6, king on f6. Black king on h8. Should white play Qg7?',
            options: ['Yes, it gives checkmate!', 'No, it causes stalemate!'],
            correctIndex: 0,
            explanation: "Yes! Qg7 is checkmate because the queen attacks h8 and the king has no escape. This one IS checkmate!",
            fen: '7k/8/5K1Q/8/8/8/8/8 w - - 0 1',
          ),
          QuizStep(
            question: 'White queen on f7, white king on f5, black king on h8. Should white play Qg7?',
            options: ['Yes, it gives checkmate!', 'No, it causes stalemate!'],
            correctIndex: 1,
            explanation: "Stalemate! After Qg7, the black king on h8 is NOT in check but has no legal moves. Give check instead!",
            fen: '7k/5Q2/8/5K2/8/8/8/8 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "Always ask yourself: after my move, does the opponent have ANY legal move? If not, and they're not in check, it's stalemate!",
            emotion: 'thinking',
          ),
          MascotSpeechStep(
            message: "Great awareness! Avoiding stalemate is a key skill!",
            emotion: 'happy',
          ),
        ],
      );
}
