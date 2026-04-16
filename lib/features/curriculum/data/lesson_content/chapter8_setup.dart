import '../../domain/entities/lesson.dart';

/// Chapter 8: Board Setup - placing pieces in starting position.
class Chapter8Content {
  static const _startPos =
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  static List<Lesson> get lessons => [
        _whereDoesEveryoneGo,
        _speedSetup,
      ];

  static Lesson get _whereDoesEveryoneGo => const Lesson(
        id: 'ch8_l1',
        title: 'Where Does Everyone Go?',
        description: 'Drag pieces to their starting squares',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Before every chess game, you need to set up the board! Let me teach you where each piece goes.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: _startPos,
            message:
                "Here's the starting position. White pieces go on rows 1 and 2, black on rows 7 and 8.",
          ),
          MascotSpeechStep(
            message:
                "Pawns fill the second row (rank 2 for white, rank 7 for black). That's 8 little soldiers each!",
            emotion: 'explaining',
            fen: '8/pppppppp/8/8/8/8/PPPPPPPP/8 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "Rooks go in the corners! a1, h1 for white. a8, h8 for black.",
            emotion: 'explaining',
            fen: 'r6r/8/8/8/8/8/8/R6R w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "Knights go next to the rooks. b1, g1 for white.",
            emotion: 'explaining',
            fen: '1n4n1/8/8/8/8/8/8/1N4N1 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "Bishops go next to the knights. c1, f1 for white.",
            emotion: 'explaining',
            fen: '2b2b2/8/8/8/8/8/8/2B2B2 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "Now the tricky part! The QUEEN goes on her own color. White queen on d1 (light square), black queen on d8 (dark square).",
            emotion: 'excited',
            fen: '3q4/8/8/8/8/8/8/3Q4 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "And the KING goes on the remaining square. White king on e1, black king on e8.",
            emotion: 'explaining',
            fen: '3qk3/8/8/8/8/8/8/3QK3 w - - 0 1',
          ),
          QuizStep(
            question: 'Where does the white queen start?',
            options: ['d1', 'e1', 'd2', 'e2'],
            correctIndex: 0,
            explanation:
                "d1! Remember: the queen goes on her own color. White queen on the light square d1!",
          ),
          QuizStep(
            question: 'Which piece goes in the corner?',
            options: ['Bishop', 'Knight', 'Rook', 'Queen'],
            correctIndex: 2,
            explanation: "Rooks go in the corners! a1, h1, a8, and h8.",
          ),
          ShowPositionStep(
            fen: _startPos,
            message:
                "Here's the complete setup! Remember: rooks in corners, then knights, bishops, queen on her color, king next to her.",
          ),
          MascotSpeechStep(
            message:
                "Tip: remember 'Queen on her own color' and you'll never mix up king and queen!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _speedSetup => const Lesson(
        id: 'ch8_l2',
        title: 'Speed Setup',
        description: 'How fast can you set up the board?',
        xpReward: 30,
        isMiniGame: true,
        steps: [
          MascotSpeechStep(
            message:
                "Quick quiz! Can you remember where all the pieces go?",
            emotion: 'excited',
          ),
          QuizStep(
            question: 'Which piece stands between the rook and the bishop?',
            options: ['Queen', 'King', 'Knight', 'Pawn'],
            correctIndex: 2,
            explanation: 'The knight! The order from the corner is: Rook, Knight, Bishop.',
          ),
          QuizStep(
            question: 'On which rank do white pawns start?',
            options: ['Rank 1', 'Rank 2', 'Rank 3', 'Rank 7'],
            correctIndex: 1,
            explanation: "Rank 2! White's pawns form a line on the second row.",
          ),
          QuizStep(
            question: 'Where does the black king start?',
            options: ['d8', 'e8', 'd1', 'e1'],
            correctIndex: 1,
            explanation: 'e8! The black king starts on e8.',
          ),
          QuizStep(
            question: '"Queen on her own color" means...',
            options: [
              'White queen on dark, black queen on light',
              'White queen on light, black queen on dark',
              'Both queens on light squares',
              'Both queens on dark squares',
            ],
            correctIndex: 1,
            explanation:
                'White queen on the light square (d1), black queen on the dark square (d8)!',
          ),
          MascotSpeechStep(
            message: "You know the setup perfectly! Time for real chess!",
            emotion: 'happy',
          ),
        ],
      );
}
