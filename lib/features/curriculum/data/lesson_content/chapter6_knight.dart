import '../../domain/entities/lesson.dart';

/// Chapter 6: "Protecting the King" — King movement, check, and checkmate combined.
class Chapter6Content {
  static List<Lesson> get lessons => [
        _carefulKing,
        _dangerCheck,
        _noEscapeCheckmate,
      ];

  static Lesson get _carefulKing => const Lesson(
        id: 'ch6_l1',
        title: 'The Careful King',
        description: 'One step at a time!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Here he is — the KING! He's the most important piece in the entire game. If you lose him... it's GAME OVER!",
            emotion: 'storytelling',
            fen: '8/8/8/8/4K3/8/8/8 w - - 0 1',
          ),
          MascotSpeechStep(
            message:
                "But he's slow — just one step at a time, in any direction. He's important, not fast!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/4K3/8/8/8 w - - 0 1',
            message: "Move the King! Any direction, but only one square at a time!",
            highlightSquares: ['d5', 'e5', 'f5', 'd4', 'f4', 'd3', 'e3', 'f3'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/4K3/8/8/8 w - - 0 1',
            acceptedMoves: [
              ('e4', 'd5'), ('e4', 'e5'), ('e4', 'f5'),
              ('e4', 'd4'), ('e4', 'f4'),
              ('e4', 'd3'), ('e4', 'e3'), ('e4', 'f3'),
            ],
            hintMessage: "One step, any direction! He's careful but steady!",
            successMessage: "One careful step. That's the King — slow but mighty!",
            showValidMoves: true,
          ),
          MascotSpeechStep(
            message:
                "The whole game revolves around the King. Protect YOURS, trap THEIRS. Simple idea, complex game!",
            emotion: 'explaining',
          ),
        ],
      );

  static Lesson get _dangerCheck => const Lesson(
        id: 'ch6_l2',
        title: 'Danger! Check!',
        description: 'The king is under attack!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "UH OH! When an enemy piece directly attacks the King, that's called CHECK! The King MUST escape — no excuses!",
            emotion: 'worried',
          ),
          ShowPositionStep(
            fen: '4k3/8/8/8/4R3/8/8/4K3 w - - 0 1',
            message: "The white Rook is attacking the black King! That's CHECK!",
            arrows: [('e4', 'e8')],
            dangerSquares: ['e8'],
          ),
          MascotSpeechStep(
            message:
                "Three ways to escape check:\n1. MOVE the king away\n2. BLOCK the attack\n3. CAPTURE the attacker!",
            emotion: 'explaining',
          ),
          // Player must escape check
          WaitForMoveStep(
            fen: '8/8/8/8/4r3/8/8/4K3 w - - 0 1',
            acceptedMoves: [('e1', 'd1'), ('e1', 'f1'), ('e1', 'd2'), ('e1', 'f2')],
            hintMessage: "Your King is in check! Move him to a safe square!",
            successMessage: "Phew! The King escaped! That was close!",
            failMessage: "That square is still dangerous! Try a different direction!",
          ),
          MascotSpeechStep(
            message:
                "Nice escape! But what if there's NO escape? That's the scariest word in chess...",
            emotion: 'worried',
          ),
        ],
      );

  static Lesson get _noEscapeCheckmate => const Lesson(
        id: 'ch6_l3',
        title: 'No Escape: Checkmate',
        description: 'Game over for the enemy!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message:
                "CHECKMATE! That's when the King is in check AND there's absolutely NO way to escape! The game is OVER!",
            emotion: 'excited',
          ),
          ShowPositionStep(
            fen: '6k1/5ppp/8/8/8/8/8/R3K3 w - - 0 1',
            message: "Look — the black King is trapped behind his own pawns. If the Rook attacks the back row...",
            arrows: [('a1', 'a8')],
          ),
          WaitForMoveStep(
            fen: '6k1/5ppp/8/8/8/8/8/R3K3 w - - 0 1',
            acceptedMoves: [('a1', 'a8')],
            hintMessage: "Move the rook to the 8th row! The king is trapped!",
            successMessage: "CHECKMATE! The King can't escape — his own pawns block him! GAME OVER!",
          ),
          MascotSpeechStep(
            message:
                "That's the whole goal of chess: CHECKMATE the enemy King! Not capture him — trap him so he CAN'T escape!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message:
                "We've found ALL the pieces! Now it's time for our FIRST REAL BATTLE! Let's set up the army!",
            emotion: 'determined',
          ),
        ],
      );
}
