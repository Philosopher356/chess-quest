import '../../domain/entities/lesson.dart';

/// Chapter 7: "The First Battle" — Assemble the army, learn piece values, play first game.
class Chapter7Content {
  static const _startPos =
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  static List<Lesson> get lessons => [
        _battleFormation,
        _knowYourWorth,
        _intoBattle,
      ];

  static Lesson get _battleFormation => const Lesson(
        id: 'ch7_l1',
        title: 'Battle Formation',
        description: 'Place your army!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Our army is ready! Before every battle, we set up in formation. Let me show you where everyone goes!",
            emotion: 'determined',
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/PPPPPPPP/8 w - - 0 1',
            message: "Pawns form the front line — 8 brave soldiers on the second row!",
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/PPPPPPPP/R6R w - - 0 1',
            message: "Rooks guard the corners — the castle towers of our army!",
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/PPPPPPPP/RN4NR w - - 0 1',
            message: "Knights stand next to the Rooks — that's me and my brother!",
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/PPPPPPPP/RNB2BNR w - - 0 1',
            message: "Bishops take their place — one on light, one on dark!",
          ),
          ShowPositionStep(
            fen: '8/8/8/8/8/8/PPPPPPPP/RNBQ1BNR w - - 0 1',
            message: "The Queen goes on her OWN COLOR! White queen on white, black queen on black!",
          ),
          ShowPositionStep(
            fen: _startPos,
            message: "And the King takes the last spot. The COMPLETE army! Both sides are ready!",
          ),
          MascotSpeechStep(
            message:
                "Remember: Rooks in corners, Knights next, Bishops next, Queen on her color, King beside her! Easy!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _knowYourWorth => const Lesson(
        id: 'ch7_l2',
        title: 'Know Your Worth',
        description: 'Not all pieces are equal!',
        xpReward: 25,
        steps: [
          MascotSpeechStep(
            message:
                "Before we fight, you need to know what each piece is WORTH. If you trade your Queen for a Pawn... that's a DISASTER!",
            emotion: 'worried',
          ),
          MascotSpeechStep(
            message:
                "Here's the scoreboard:\n- Pawn = 1 point\n- Knight (me!) = 3 points\n- Bishop = 3 points\n- Rook = 5 points\n- Queen = 9 points\n- King = PRICELESS!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: "Your Rook (5 pts) can capture their Knight (3 pts) and they'll capture back. Good trade?",
            options: ['Yes!', 'No — I lose more than I gain'],
            correctIndex: 1,
            explanation: "No! You'd lose 5 points but only gain 3. That's a bad trade!",
          ),
          QuizStep(
            question: "Your Knight (3 pts) can capture their Rook (5 pts) and they CAN'T capture back. Good trade?",
            options: ['Amazing!', "No, it's a trap"],
            correctIndex: 0,
            explanation: "Incredible! You gain 5 points and lose nothing! Always take free pieces!",
          ),
          MascotSpeechStep(
            message:
                "Simple rule: only trade if you capture MORE than you lose. Now... it's time for your FIRST BATTLE!",
            emotion: 'determined',
          ),
        ],
      );

  static Lesson get _intoBattle => const Lesson(
        id: 'ch7_l3',
        title: 'Into Battle!',
        description: 'Your first real game!',
        xpReward: 40,
        steps: [
          MascotSpeechStep(
            message:
                "This is it! Your first REAL chess game! I'll be right here giving you tips. Don't worry about winning — just try your best!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message:
                "Quick tips:\n- Move pawns to the center first\n- Get your knights and bishops out early\n- Protect your King!\n- Look for forks and captures!",
            emotion: 'explaining',
          ),
          FreePlayStep(
            fen: _startPos,
            message: "Play your first game! Move a pawn to start! I'll be here if you need help!",
          ),
          MascotSpeechStep(
            message:
                "You did it! Your first battle! No matter the result, you're already a chess player! The Awakening is complete — but the Shadow is still out there...",
            emotion: 'proud',
          ),
          MascotSpeechStep(
            message:
                "Time to gather our forces and learn the SECRETS of battle. Onward to The Gathering!",
            emotion: 'determined',
          ),
        ],
      );
}
