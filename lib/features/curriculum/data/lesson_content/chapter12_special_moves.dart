import '../../domain/entities/lesson.dart';

/// Chapter 12: Special Moves - castling, en passant, promotion.
class Chapter12Content {
  static List<Lesson> get lessons => [
        _castling,
        _enPassant,
        _pawnPromotion,
      ];

  static Lesson get _castling => const Lesson(
        id: 'ch12_l1',
        title: 'Castling',
        description: 'King and rook team up!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "Castling is a special move where the king and rook move TOGETHER in one turn! It's the only move where two pieces move at once.",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: 'r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq - 0 1',
            message:
                "Kingside castling: the king moves two squares toward the rook, and the rook jumps over to the other side!",
            arrows: [('e1', 'g1'), ('h1', 'f1')],
            highlightSquares: ['g1', 'f1'],
          ),
          ShowPositionStep(
            fen: 'r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq - 0 1',
            message:
                "Queenside castling: same idea but toward the a-rook. King goes to c1, rook to d1.",
            arrows: [('e1', 'c1'), ('a1', 'd1')],
            highlightSquares: ['c1', 'd1'],
          ),
          MascotSpeechStep(
            message:
                "Castling has RULES! You can't castle if:\n- The king or rook has already moved\n- The king is currently in check\n- The king would pass through or land on an attacked square\n- There are pieces between king and rook",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Can white castle here? (King on e1, rook on h1, knight on f1)',
            options: ['Yes', 'No - piece in the way'],
            correctIndex: 1,
            explanation: "No! The knight on f1 is between the king and rook. Clear the path first!",
            fen: 'r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KN1R w KQkq - 0 1',
          ),
          QuizStep(
            question: 'Why is castling important?',
            options: [
              'It looks cool',
              'It protects the king and activates the rook',
              'It gives you extra points',
              'It lets you move two pieces',
            ],
            correctIndex: 1,
            explanation:
                "Castling tucks the king safely behind pawns AND brings the rook toward the center. Two benefits in one move!",
          ),
          MascotSpeechStep(
            message: "Castle early in your games to keep your king safe!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _enPassant => const Lesson(
        id: 'ch12_l2',
        title: 'En Passant',
        description: 'The sneaky pawn capture!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "En passant is the sneakiest move in chess! It's French for 'in passing'.",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/8/8/4Pp2/8/8/8/8 w - f6 0 1',
            message:
                "When an enemy pawn jumps two squares and lands BESIDE your pawn, you can capture it 'in passing' as if it only moved one square!",
            arrows: [('e5', 'f6')],
            objectiveSquares: ['f6'],
          ),
          MascotSpeechStep(
            message:
                "Important: you can ONLY do en passant on the very next move! If you wait, the chance is gone forever!",
            emotion: 'explaining',
          ),
          WaitForMoveStep(
            fen: '8/8/8/4Pp2/8/8/8/8 w - f6 0 1',
            acceptedMoves: [('e5', 'f6')],
            hintMessage: 'Capture the pawn en passant by moving diagonally to f6!',
            successMessage: "En passant! You captured the pawn as it tried to sneak by!",
          ),
          QuizStep(
            question: 'When can you use en passant?',
            options: [
              'Any time a pawn is next to yours',
              'Only when an enemy pawn just moved two squares beside yours',
              'Whenever you want',
              'Only in the opening',
            ],
            correctIndex: 1,
            explanation:
                "Only immediately after an enemy pawn jumps two squares and lands beside your pawn. One chance only!",
          ),
          MascotSpeechStep(
            message: "En passant is rare but important! Many beginners don't know it exists!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _pawnPromotion => const Lesson(
        id: 'ch12_l3',
        title: 'Pawn Promotion',
        description: 'The pawn becomes a queen!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "When a pawn reaches the other end of the board, something magical happens... it gets PROMOTED!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '8/4P3/8/8/8/8/8/4K3 w - - 0 1',
            message:
                "This pawn is one step from rank 8. When it gets there, it transforms into any piece you choose!",
            arrows: [('e7', 'e8')],
            objectiveSquares: ['e8'],
          ),
          MascotSpeechStep(
            message:
                "You can promote to a Queen, Rook, Bishop, or Knight. Almost always choose the queen - she's the strongest!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message:
                "But sometimes a knight is better! If a knight gives checkmate but a queen doesn't - promote to a knight! This is called 'underpromotion'.",
            emotion: 'thinking',
          ),
          QuizStep(
            question: 'What usually is the best piece to promote a pawn to?',
            options: ['Rook', 'Bishop', 'Knight', 'Queen'],
            correctIndex: 3,
            explanation:
                "The queen! She's worth 9 points and is the most powerful piece. Promote to queen unless you have a very good reason not to!",
          ),
          QuizStep(
            question: 'Can you have two queens on the board?',
            options: ['No, only one queen allowed', 'Yes, through promotion!'],
            correctIndex: 1,
            explanation:
                "Yes! Through promotion, you could theoretically have up to 9 queens (1 original + 8 promoted pawns)!",
          ),
          MascotSpeechStep(
            message:
                "That's why pawns are more valuable than they look! Every pawn could become a queen!",
            emotion: 'happy',
          ),
        ],
      );
}
