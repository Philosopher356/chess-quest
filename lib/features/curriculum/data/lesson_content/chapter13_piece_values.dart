import '../../domain/entities/lesson.dart';

/// Chapter 13: Piece Values - understanding material advantage.
class Chapter13Content {
  static List<Lesson> get lessons => [
        _whosWorthMore,
        _goodAndBadTrades,
      ];

  static Lesson get _whosWorthMore => const Lesson(
        id: 'ch13_l1',
        title: "Who's Worth More?",
        description: 'The value of each piece',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Not all pieces are created equal! Each piece has a point value that helps you decide whether a trade is good.",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message:
                "Here are the values:\n- Pawn = 1 point\n- Knight = 3 points\n- Bishop = 3 points\n- Rook = 5 points\n- Queen = 9 points\n- King = Priceless!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Which is worth more: a knight or a rook?',
            options: ['Knight (3 pts)', 'Rook (5 pts)', 'They are equal'],
            correctIndex: 1,
            explanation: "The rook is worth 5 points vs the knight's 3. Rooks are more valuable!",
          ),
          QuizStep(
            question: 'Which is worth more: a bishop + knight, or a rook?',
            options: ['Bishop + Knight (6 pts)', 'Rook (5 pts)', 'They are equal'],
            correctIndex: 0,
            explanation: "Bishop (3) + Knight (3) = 6 points, which is more than a rook (5)!",
          ),
          QuizStep(
            question: 'Which is worth more: two rooks or one queen?',
            options: ['Two Rooks (10 pts)', 'Queen (9 pts)', 'They are equal'],
            correctIndex: 0,
            explanation:
                "Two rooks (10 points) are slightly more valuable than a queen (9 points)! In practice they're roughly equal.",
          ),
          MascotSpeechStep(
            message:
                "These values aren't perfect rules - position matters too! But they're a great guide for beginners.",
            emotion: 'thinking',
          ),
        ],
      );

  static Lesson get _goodAndBadTrades => const Lesson(
        id: 'ch13_l2',
        title: 'Good Trades & Bad Trades',
        description: 'Should you capture?',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "When you capture a piece and your opponent recaptures, that's a TRADE. Is it a good trade?",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Your bishop (3 pts) can capture their rook (5 pts), but they will recapture. Is this a good trade?',
            options: ['Yes! I gain 2 points', 'No, I lose my bishop', "It's equal"],
            correctIndex: 0,
            explanation:
                "Great trade! You lose 3 points (bishop) but gain 5 points (rook). That's +2 material advantage!",
          ),
          QuizStep(
            question: 'Your queen (9 pts) can capture their knight (3 pts), but they will recapture with a pawn. Good trade?',
            options: ['Yes!', 'Terrible trade!', "It's okay"],
            correctIndex: 1,
            explanation:
                "Terrible! You gain 3 points (knight) but lose 9 points (queen). That's -6! Never trade your queen for a minor piece!",
          ),
          QuizStep(
            question: 'Your knight (3 pts) can capture their bishop (3 pts). They recapture. Good trade?',
            options: ['Good for me', 'Bad for me', 'Equal trade'],
            correctIndex: 2,
            explanation:
                "It's an equal trade! Knight = Bishop = 3 points each. Neither side gains or loses material.",
          ),
          QuizStep(
            question: 'Your rook (5 pts) can capture their queen (9 pts)! They can\'t recapture. Should you?',
            options: ['Absolutely!', 'No, it might be a trap', 'Only if I have to'],
            correctIndex: 0,
            explanation:
                "Absolutely! Capturing a queen with a rook when they can't take back is amazing! You gain 9 points for free!",
          ),
          MascotSpeechStep(
            message:
                "Rule of thumb: trade when you capture more points than you lose. Avoid trading your valuable pieces for less valuable ones!",
            emotion: 'happy',
          ),
          MascotSpeechStep(
            message:
                "Congratulations! You've completed the Rules of Battle! You now know all the basic rules of chess!",
            emotion: 'excited',
          ),
        ],
      );
}
