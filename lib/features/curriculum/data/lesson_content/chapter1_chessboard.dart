import '../../domain/entities/lesson.dart';

/// Chapter 1: "Into the Board" — The child arrives in the enchanted board world.
/// NO coordinates, NO theory. Pure discovery and wonder.
class Chapter1Content {
  static const _emptyBoard = '8/8/8/8/8/8/8/8 w - - 0 1';

  static List<Lesson> get lessons => [
        _magicBoard,
        _lostPawns,
        _bravePawnJourney,
      ];

  /// Lesson 1: Arrive in the world. Tap squares. Meet Sir Hops.
  static Lesson get _magicBoard => const Lesson(
        id: 'ch1_l1',
        title: 'The Magic Board',
        description: 'Where am I?',
        xpReward: 15,
        steps: [
          MascotSpeechStep(
            message: "Whoa! Where am I? Everything is... checkered!",
            emotion: 'surprised',
            fen: _emptyBoard,
          ),
          MascotSpeechStep(
            message:
                "Hey there! I'm Sir Hops! You've stumbled into the Enchanted Board! This whole world is made of squares. Come on, explore! Tap anywhere!",
            emotion: 'excited',
            fen: _emptyBoard,
          ),
          FreePlayStep(
            fen: _emptyBoard,
            message: "Tap around the board! Each square is a little land in this world!",
          ),
          MascotSpeechStep(
            message:
                "See those two colors? Light and dark, like a magical checkerboard! I live on the light squares. The dark ones are a bit spooky for me!",
            emotion: 'storytelling',
            fen: _emptyBoard,
          ),
          MascotSpeechStep(
            message:
                "The Shadow has frozen this kingdom. All my friends — the chess pieces — are trapped! Only someone from the Outside can help. That's YOU!",
            emotion: 'determined',
          ),
          MascotSpeechStep(
            message:
                "Will you help me save the Enchanted Board? Let's start by rescuing some friends!",
            emotion: 'excited',
          ),
        ],
      );

  /// Lesson 2: Rescue pawns. Learn pawn movement through doing.
  static Lesson get _lostPawns => const Lesson(
        id: 'ch1_l2',
        title: 'The Lost Pawns',
        description: 'Rescue the trapped pawns!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Oh no! The little pawns are trapped! They're the smallest pieces but SO brave. They can only move forward — help this one escape!",
            emotion: 'worried',
            fen: '8/8/8/8/8/8/4P3/8 w - - 0 1',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/4P3/8 w - - 0 1',
            message: "Move the pawn forward! It can go one or two squares on its first step!",
            highlightSquares: ['e3', 'e4'],
            arrows: [('e2', 'e3'), ('e2', 'e4')],
          ),
          WaitForMoveStep(
            fen: '8/8/8/8/8/8/4P3/8 w - - 0 1',
            acceptedMoves: [('e2', 'e3'), ('e2', 'e4')],
            hintMessage: "Push the pawn forward! Tap it and drag up!",
            successMessage: "You freed one! Pawns march forward, one step at a time!",
            failMessage: "Oops! Pawns can only go straight forward — try again!",
          ),
          MascotSpeechStep(
            message:
                "Nice! But wait — there's an enemy blocking the next pawn! Pawns capture DIAGONALLY. Sneaky, right?",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: '8/8/8/3p4/4P3/8/8/8 w - - 0 1',
            message: "The pawn captures sideways-forward! Take out the enemy!",
            arrows: [('e4', 'd5')],
            objectiveSquares: ['d5'],
          ),
          WaitForMoveStep(
            fen: '8/8/8/3p4/4P3/8/8/8 w - - 0 1',
            acceptedMoves: [('e4', 'd5')],
            hintMessage: "Capture diagonally! Move the pawn to the enemy's square!",
            successMessage: "GOT 'EM! Pawns move forward but bite diagonally!",
            failMessage: "Pawns can't capture straight ahead — try going diagonal!",
          ),
          MascotSpeechStep(
            message:
                "You're a natural! The pawn marches forward but captures diagonally. Remember that — it'll save you later!",
            emotion: 'proud',
          ),
        ],
      );

  /// Lesson 3: Navigate a pawn across the board. Discover promotion.
  static Lesson get _bravePawnJourney => const Lesson(
        id: 'ch1_l3',
        title: "The Brave Pawn's Journey",
        description: 'Help a pawn reach the other side!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message:
                "This brave little pawn wants to cross the ENTIRE board! If it reaches the other side, something magical happens...",
            emotion: 'storytelling',
          ),
          MascotSpeechStep(
            message:
                "Guide it through! Watch out for enemies — capture them or dodge around!",
            emotion: 'determined',
          ),
          CaptureChallenge(
            fen: '8/8/8/3p4/8/8/4P3/8 w - - 0 1',
            targetMoves: 5,
            piece: 'P',
            message: "Get the pawn to the top! Capture the enemy if it's in your diagonal!",
          ),
          MascotSpeechStep(
            message:
                "WHOA! Did you see that? When a pawn reaches the other side, it TRANSFORMS! It can become a Queen, a Rook, a Bishop, or even a Knight!",
            emotion: 'surprised',
          ),
          MascotSpeechStep(
            message:
                "Usually you pick the Queen — she's the most powerful piece in the game! We'll meet her soon!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "Two pawns rescued! But there are bigger pieces out there who need our help. Let's go find the Rooks!",
            emotion: 'determined',
          ),
        ],
      );
}
