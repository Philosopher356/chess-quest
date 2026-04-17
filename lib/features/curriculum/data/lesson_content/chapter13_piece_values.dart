import '../../domain/entities/lesson.dart';

/// Chapter 13: "The Proving Ground" — Mixed challenges testing everything learned.
class Chapter13Content {
  static List<Lesson> get lessons => [
        _theChallenge,
        _readyForWar,
      ];

  static Lesson get _theChallenge => const Lesson(
        id: 'ch13_l1',
        title: 'The Challenge',
        description: 'Mixed puzzles!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Before we enter the Training Grounds, you must pass the PROVING GROUND! Let's see what you've learned!",
            emotion: 'determined',
          ),
          // Checkmate puzzle
          WaitForMoveStep(
            fen: '5rk1/5ppp/8/8/8/8/5PPP/R5K1 w - - 0 1',
            acceptedMoves: [('a1', 'a8')],
            hintMessage: "Look at the back rank... is the King trapped?",
            successMessage: "CHECKMATE! You remembered the back rank ambush!",
          ),
          // Fork puzzle
          WaitForMoveStep(
            fen: '3qk3/8/8/8/8/5N2/8/4K3 w - - 0 1',
            acceptedMoves: [('f3', 'e5')],
            hintMessage: "Can the knight attack TWO pieces at once?",
            successMessage: "FORK! Knight attacks king AND queen! Classic Sir Hops move!",
          ),
          // Escape check
          WaitForMoveStep(
            fen: '8/8/8/8/4r3/8/8/3K4 w - - 0 1',
            acceptedMoves: [('d1', 'c1'), ('d1', 'c2'), ('d1', 'd2'), ('d1', 'e1')],
            hintMessage: "You're in check! Move the King to safety!",
            successMessage: "Escaped! You know how to handle check!",
          ),
          MascotSpeechStep(
            message: "You passed! Your chess instincts are getting sharp!",
            emotion: 'proud',
          ),
        ],
      );

  static Lesson get _readyForWar => const Lesson(
        id: 'ch13_l2',
        title: 'Ready for War',
        description: 'Prove yourself!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "One final test — a real game against the Shadow's weakest warrior! Use everything you've learned!",
            emotion: 'determined',
          ),
          MascotSpeechStep(
            message: "Remember:\n- Control the center\n- Develop your pieces\n- Castle your king\n- Look for forks and captures!\n\nYou've got this!",
            emotion: 'explaining',
          ),
          FreePlayStep(
            fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
            message: "Fight! I'll be watching with pride!",
          ),
          MascotSpeechStep(
            message: "The Gathering is COMPLETE! You've rallied the army and learned the rules of battle! Now it's time for the TRAINING GROUNDS — where we master deadly TACTICS!",
            emotion: 'excited',
          ),
        ],
      );
}
