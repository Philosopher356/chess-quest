import '../../domain/entities/lesson.dart';

/// Chapter 28: Complete Games - study famous games.
class Chapter28Content {
  static List<Lesson> get lessons => [
        _famousGames,
      ];

  static Lesson get _famousGames => const Lesson(
        id: 'ch28_l1',
        title: 'Famous Games',
        description: 'Guess the master move!',
        xpReward: 40,
        steps: [
          MascotSpeechStep(
            message: "Let's study a famous short game to see everything we've learned in action!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message: "THE OPERA GAME (1858)\nPaul Morphy vs Duke of Brunswick & Count Isouard\nOne of the most beautiful games ever played!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1',
            message: "1.e4 e5 - Both sides start with strong center moves.",
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 0 1',
            message: "2.Nf3 - Morphy develops and attacks e5. 2...d6 - defending the pawn.",
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/ppp2ppp/3p4/4p3/3PP3/5N2/PPP2PPP/RNBQKB1R b KQkq - 0 1',
            message: "3.d4 - Morphy opens the center immediately! Following principle: control the center!",
            arrows: [('d4', 'e5')],
          ),
          MascotSpeechStep(
            message: "Morphy's principles: rapid development, open lines, piece coordination. He developed EVERY piece while his opponents lagged behind!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'rn1qkb1r/ppp2ppp/3p1n2/4p1B1/3PP3/5N2/PPP2PPP/RN1QKB1R b KQkq - 0 1',
            message: "After Bg5 pinning the knight! Morphy develops with threats. Every move either develops or attacks.",
            arrows: [('g5', 'f6'), ('g5', 'd8')],
          ),
          MascotSpeechStep(
            message: "The game finished with a brilliant queen sacrifice and back rank mate! Morphy had every piece active while his opponents' pieces were still on the back rank!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message: "Key lessons from the Opera Game:\n1. Develop ALL your pieces quickly\n2. Open the center when ahead in development\n3. Don't waste time with unnecessary pawn moves\n4. Every move should have a purpose!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "Congratulations! You've completed the ENTIRE ChessQuest curriculum! From learning the board to studying master games! You are a true chess student!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message: "But the journey never ends! Keep solving puzzles, playing games, and studying. Every grandmaster is still learning! See you on the board!",
            emotion: 'happy',
          ),
        ],
      );
}
