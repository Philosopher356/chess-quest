import '../../domain/entities/lesson.dart';

/// Chapter 1: The Chessboard - teaches the board, ranks, files, coordinates.
class Chapter1Content {
  static const _emptyBoard = '8/8/8/8/8/8/8/8 w - - 0 1';
  static const _startPos =
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  static List<Lesson> get lessons => [
        _theBattlefield,
        _ranksAndFiles,
        _lightAndDark,
      ];

  static Lesson get _theBattlefield => const Lesson(
        id: 'ch1_l1',
        title: 'The Battlefield',
        description: 'Discover the 64 squares',
        xpReward: 15,
        steps: [
          MascotSpeechStep(
            message:
                "Welcome to ChessQuest! I'm Sir Hops, your guide to the world of chess!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                'This is the chessboard - a big square made of 64 smaller squares!',
            emotion: 'explaining',
            fen: _emptyBoard,
          ),
          ShowPositionStep(
            fen: _emptyBoard,
            message: 'The board has 8 rows and 8 columns. Tap any square!',
          ),
          MascotSpeechStep(
            message:
                'Chess battles happen right here on this board. Every piece has its own way of moving across these squares!',
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: _startPos,
            message:
                'Here is what it looks like when all the pieces are ready for battle!',
          ),
          MascotSpeechStep(
            message:
                "Amazing! You've discovered the chessboard! Let's learn more about it next!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _ranksAndFiles => const Lesson(
        id: 'ch1_l2',
        title: 'Ranks and Files',
        description: 'Learn the rows and columns',
        xpReward: 20,
        steps: [
          MascotSpeechStep(
            message:
                'Every square has an address, like a house! Let me show you how it works.',
            emotion: 'explaining',
            fen: _emptyBoard,
          ),
          ShowPositionStep(
            fen: _emptyBoard,
            message:
                'Columns go from left to right and are called FILES. They are labeled a through h.',
            highlightSquares: ['a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8'],
            arrows: [],
          ),
          ShowPositionStep(
            fen: _emptyBoard,
            message:
                'Rows go from bottom to top and are called RANKS. They are numbered 1 through 8.',
            highlightSquares: ['a1', 'b1', 'c1', 'd1', 'e1', 'f1', 'g1', 'h1'],
          ),
          MascotSpeechStep(
            message:
                'To name a square, combine the file letter and rank number. For example, the bottom-left square is a1!',
            emotion: 'explaining',
            fen: _emptyBoard,
          ),
          WaitForTapStep(
            fen: _emptyBoard,
            targetSquare: 'e4',
            message: 'Now you try! Tap the square e4!',
            hintMessage: "e4 is in the 'e' column, row 4. It's near the center!",
            successMessage: "That's e4! Right in the center of the board!",
          ),
          WaitForTapStep(
            fen: _emptyBoard,
            targetSquare: 'd5',
            message: 'Great! Now tap d5!',
            hintMessage: "d5 is in the 'd' column, row 5.",
            successMessage: 'Perfect! You found d5!',
          ),
          WaitForTapStep(
            fen: _emptyBoard,
            targetSquare: 'a1',
            message: 'Tap the corner square a1!',
            hintMessage: 'a1 is the very bottom-left corner!',
            successMessage: 'Excellent! a1 is in the corner!',
          ),
          WaitForTapStep(
            fen: _emptyBoard,
            targetSquare: 'h8',
            message: 'Now find h8 - the opposite corner!',
            hintMessage: 'h8 is the very top-right corner!',
            successMessage: "You're a natural! h8 is way up there!",
          ),
          MascotSpeechStep(
            message:
                "Awesome! You can now read the chess map! Every great chess player knows their coordinates!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _lightAndDark => const Lesson(
        id: 'ch1_l3',
        title: 'Light and Dark',
        description: 'The two colors of the board',
        xpReward: 15,
        steps: [
          MascotSpeechStep(
            message:
                "Notice how the board has two colors? Light squares and dark squares take turns!",
            emotion: 'explaining',
            fen: _emptyBoard,
          ),
          ShowPositionStep(
            fen: _emptyBoard,
            message:
                'Light and dark squares alternate like a checkerboard pattern. a1 is always a dark square!',
            highlightSquares: ['a1', 'c1', 'e1', 'g1', 'b2', 'd2', 'f2', 'h2'],
          ),
          QuizStep(
            question: 'What color is the square e4?',
            options: ['Light', 'Dark'],
            correctIndex: 0,
            explanation:
                'e4 is a light square! The center squares e4 and d5 are light, while d4 and e5 are dark.',
            fen: _emptyBoard,
          ),
          QuizStep(
            question: 'What color is the square d4?',
            options: ['Light', 'Dark'],
            correctIndex: 1,
            explanation: 'd4 is a dark square!',
            fen: _emptyBoard,
          ),
          QuizStep(
            question: 'The bottom-right corner (h1) is always...',
            options: ['Light', 'Dark'],
            correctIndex: 0,
            explanation:
                'h1 is always a light square! Remember: "light on right" when setting up the board!',
          ),
          MascotSpeechStep(
            message:
                "Great job! You now know all about the chessboard! You're ready to meet the pieces!",
            emotion: 'excited',
          ),
        ],
      );
}
