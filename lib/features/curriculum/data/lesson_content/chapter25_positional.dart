import '../../domain/entities/lesson.dart';

/// Chapter 25: Positional Play.
class Chapter25Content {
  static List<Lesson> get lessons => [
        _prophylaxis,
        _spaceAdvantage,
      ];

  static Lesson get _prophylaxis => const Lesson(
        id: 'ch25_l1',
        title: 'Prophylaxis',
        description: "Stop your opponent's plan!",
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "PROPHYLAXIS means preventing your opponent's plans before they happen! Ask: 'What does my opponent WANT to do?'",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "Before every move, ask yourself:\n1. What is my opponent threatening?\n2. What would they play if it were their turn?\n3. Can I stop their plan while improving my position?",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'r1bqkb1r/pppp1ppp/2n2n2/4p3/4P3/2N2N2/PPPP1PPP/R1BQKB1R w KQkq - 0 1',
            message: "Black wants to play ...d5, challenging the center. White can play d3 to support e4, preventing Black's plan!",
            arrows: [('d7', 'd5'), ('d2', 'd3')],
          ),
          QuizStep(
            question: 'What is prophylaxis?',
            options: [
              'A type of opening',
              'Preventing your opponent\'s plans before they execute them',
              'A checkmate pattern',
              'Moving your king to safety',
            ],
            correctIndex: 1,
            explanation: "Prophylaxis is proactive defense: stopping threats before they become dangerous. The best players constantly think about what their opponent wants!",
          ),
          MascotSpeechStep(
            message: "The question 'What does my opponent want?' will improve your chess more than any tactic!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _spaceAdvantage => const Lesson(
        id: 'ch25_l2',
        title: 'Space Advantage',
        description: 'Control more of the board!',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "SPACE ADVANTAGE means your pieces have more room to maneuver than your opponent's. More space = more options!",
            emotion: 'explaining',
          ),
          ShowPositionStep(
            fen: 'rnbqkbnr/pppp1ppp/8/4p3/3PP3/8/PPP2PPP/RNBQKBNR b KQkq - 0 1',
            message: "After 1.d4 e5 2.e4, White has pushed two center pawns forward. White controls more territory than Black!",
            highlightSquares: ['d4', 'e4'],
          ),
          MascotSpeechStep(
            message: "With more space, your pieces can move freely and switch between kingside and queenside. Your opponent's pieces are cramped!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "But beware: overextending can leave weaknesses! Push pawns forward only when supported.",
            emotion: 'thinking',
          ),
          QuizStep(
            question: 'What is the risk of a space advantage?',
            options: [
              'Your pieces become weaker',
              'Advanced pawns can become targets if not supported',
              'You have to castle early',
              'Your opponent always has a tactical shot',
            ],
            correctIndex: 1,
            explanation: "Advanced pawns can become weak targets! If you push too far without support, your opponent can attack the overextended pawns.",
          ),
          MascotSpeechStep(
            message: "Balance is key: claim space but support your pawns. This is high-level chess thinking!",
            emotion: 'happy',
          ),
        ],
      );
}
