import '../../domain/entities/lesson.dart';

/// Chapter 26: Calculation.
class Chapter26Content {
  static List<Lesson> get lessons => [
        _blindCalculation,
        _candidateMoves,
      ];

  static Lesson get _blindCalculation => const Lesson(
        id: 'ch26_l1',
        title: 'Blind Calculation',
        description: 'Calculate without seeing!',
        xpReward: 35,
        steps: [
          MascotSpeechStep(
            message: "Strong players can calculate 3-5 moves ahead IN THEIR HEAD. Let's train your visualization!",
            emotion: 'excited',
          ),
          MascotSpeechStep(
            message: "I'll describe moves. Try to picture the position after each move without looking at the board!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'Starting position. White plays 1.e4. Where is the pawn now?',
            options: ['e2', 'e3', 'e4', 'e5'],
            correctIndex: 2,
            explanation: "e4! The pawn moved from e2 to e4.",
          ),
          QuizStep(
            question: 'After 1.e4 e5 2.Nf3. Which black pawn is attacked by the knight?',
            options: ['d5', 'e5', 'f5', 'No pawn is attacked'],
            correctIndex: 1,
            explanation: "The e5 pawn! The knight on f3 attacks e5 and d4.",
          ),
          QuizStep(
            question: 'After 1.e4 e5 2.Nf3 Nc6 3.Bc4. What is the bishop aiming at?',
            options: ['d5', 'f7', 'g6', 'e6'],
            correctIndex: 1,
            explanation: "f7! The bishop on c4 attacks the weak f7 square - this is the start of the Italian Game!",
          ),
          MascotSpeechStep(
            message: "Visualization takes practice! Try to play games in your head every day, even just a few moves.",
            emotion: 'encouraging',
          ),
          MascotSpeechStep(
            message: "Start with 2-3 moves ahead and gradually increase. Grandmasters can see 10+ moves ahead!",
            emotion: 'happy',
          ),
        ],
      );

  static Lesson get _candidateMoves => const Lesson(
        id: 'ch26_l2',
        title: 'Candidate Moves',
        description: 'Find the best options',
        xpReward: 30,
        steps: [
          MascotSpeechStep(
            message: "Don't play the first move that comes to mind! Use the CANDIDATE MOVES method.",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "The technique:\n1. Find ALL checks first\n2. Then captures\n3. Then threats\n4. Evaluate each one\n5. Choose the best!",
            emotion: 'explaining',
          ),
          MascotSpeechStep(
            message: "Checks, captures, threats - CCT! Always look for these first. They're the most forcing moves!",
            emotion: 'explaining',
          ),
          QuizStep(
            question: 'In the candidate moves method, what should you look for FIRST?',
            options: ['Quiet developing moves', 'Pawn pushes', 'Checks', 'Exchanges'],
            correctIndex: 2,
            explanation: "Checks first! They're the most forcing moves - your opponent must respond. Then captures, then threats.",
          ),
          QuizStep(
            question: 'Why look at ALL candidate moves before choosing?',
            options: [
              'To waste your opponent\'s time',
              'Because the first move you see might not be the best',
              'To confuse your opponent',
              'Because you have unlimited time',
            ],
            correctIndex: 1,
            explanation: "The first move you see is rarely the best! By checking all candidates, you might find a brilliant move you'd otherwise miss.",
          ),
          MascotSpeechStep(
            message: "CCT: Checks, Captures, Threats. This one method will improve your game dramatically!",
            emotion: 'happy',
          ),
        ],
      );
}
