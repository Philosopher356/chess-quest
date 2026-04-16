import '../../domain/entities/lesson.dart';

/// Chapter 21: Piece Activity.
class Chapter21Content {
  static List<Lesson> get lessons => [
        _goodBadBishops,
        _knightOutposts,
        _rooksOnOpenFiles,
      ];

  static Lesson get _goodBadBishops => const Lesson(
        id: 'ch21_l1',
        title: 'Good vs Bad Bishops',
        description: 'Is your bishop blocked?',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Not all bishops are created equal! A 'good' bishop has open diagonals. A 'bad' bishop is blocked by its own pawns.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/3pp3/3PP3/8/5B2/8 w - - 0 1',
            message: "BAD BISHOP: White's bishop on f2 is blocked by its own pawns on d4 and e4 (they're on the same color!). It can barely move!",
            dangerSquares: ['f2'],
            highlightSquares: ['d4', 'e4'],
          ),
          ShowPositionStep(
            fen: '8/8/8/3pp3/3PP3/8/2B5/8 w - - 0 1',
            message: "GOOD BISHOP: If the bishop were on c2 (opposite color of its pawns), it would have open diagonals! Much more active!",
            highlightSquares: ['c2'],
            arrows: [('c2', 'f5'), ('c2', 'a4')],
          ),
          QuizStep(
            question: 'What makes a bishop "bad"?',
            options: [
              "It's on the edge of the board",
              "It's blocked by its own pawns on the same color squares",
              "It hasn't moved yet",
              "It's defending instead of attacking",
            ],
            correctIndex: 1,
            explanation: "A bad bishop is stuck behind its own pawns that sit on the same color. It has no open diagonals!",
          ),
          MascotSpeechStep(
            message: "Tip: place your pawns on the OPPOSITE color of your bishop to keep it active!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _knightOutposts => const Lesson(
        id: 'ch21_l2',
        title: 'Knight Outposts',
        description: 'A knight that cannot be chased!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "An OUTPOST is a square where your knight is protected by a pawn and can't be chased away by enemy pawns!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/pp3ppp/8/3Np3/4P3/8/PPP2PPP/8 w - - 0 1',
            message: "The knight on d5 is a perfect outpost! Your e4 pawn supports it, and black has no c or e pawn to chase it away!",
            highlightSquares: ['d5'],
            arrows: [('e4', 'd5')],
          ),
          MascotSpeechStep(
            message: "A knight on a strong outpost in the center can be as powerful as a rook! It controls many squares and can't be kicked out.",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'What makes a good knight outpost?',
            options: [
              'Any central square',
              'A square supported by a pawn that enemy pawns cannot attack',
              'The corner squares',
              'A square near the enemy king',
            ],
            correctIndex: 1,
            explanation: "An outpost is supported by your pawn and can't be attacked by enemy pawns. The knight stays there forever!",
          ),
          MascotSpeechStep(
            message: "Always look for outpost squares for your knights!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _rooksOnOpenFiles => const Lesson(
        id: 'ch21_l3',
        title: 'Rooks on Open Files',
        description: 'Give your rooks room!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message: "Rooks need OPEN FILES (files with no pawns) to be effective! A rook behind a wall of pawns is useless.",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/ppp2ppp/8/8/8/8/PPP2PPP/4R3 w - - 0 1',
            message: "The e-file is OPEN (no pawns). White's rook controls the entire file! This is a powerful rook!",
            arrows: [('e1', 'e8')],
            highlightSquares: ['e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7', 'e8'],
          ),
          ShowPositionStep(
            fen: '4r3/ppp2ppp/8/8/8/8/PPP2PPP/4R3 w - - 0 1',
            message: "Even better: DOUBLE your rooks on the open file! Two rooks on the same file are incredibly strong!",
          ),
          MascotSpeechStep(
            message: "Also look for SEMI-OPEN files (your pawns are gone but the opponent's pawn remains). Rooks love those too!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "Where should you place your rooks?",
            options: [
              "In the corners",
              "On open or semi-open files",
              "Behind your pawns",
              "Next to the king",
            ],
            correctIndex: 1,
            explanation: "Open and semi-open files! Rooks need clear paths to be powerful. Don't leave them stuck behind pawns!",
          ),
          MascotSpeechStep(
            message: "Active rooks = winning rooks! Give them open lines!",
            emotion: 'happy',
          ),
        ],
      );
}
