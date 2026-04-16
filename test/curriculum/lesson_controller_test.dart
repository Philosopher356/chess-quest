import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chess_quest/features/curriculum/domain/entities/lesson.dart';
import 'package:chess_quest/features/curriculum/presentation/providers/lesson_state_provider.dart';

void main() {
  late ProviderContainer container;

  final testLesson = Lesson(
    id: 'test_lesson',
    title: 'Test',
    description: 'Test lesson',
    xpReward: 20,
    steps: const [
      MascotSpeechStep(message: 'Hello!'),
      WaitForMoveStep(
        fen: '8/8/8/8/4R3/8/8/4K3 w - - 0 1',
        acceptedMoves: [('e4', 'e8')],
        successMessage: 'Correct!',
        failMessage: 'Try again!',
      ),
      QuizStep(
        question: 'What is 1+1?',
        options: ['1', '2', '3'],
        correctIndex: 1,
      ),
      MascotSpeechStep(message: 'Done!'),
    ],
  );

  setUp(() {
    container = ProviderContainer();
    // Set the active lesson
    container.read(activeLessonProvider.notifier).setLesson(testLesson);
  });

  tearDown(() {
    container.dispose();
  });

  group('LessonController', () {
    test('initial state has step index 0', () {
      final state = container.read(lessonControllerProvider);
      expect(state.currentStepIndex, equals(0));
      expect(state.isComplete, isFalse);
    });

    test('initial step is MascotSpeechStep', () {
      final state = container.read(lessonControllerProvider);
      expect(state.currentStep, isA<MascotSpeechStep>());
    });

    test('nextStep advances step index', () {
      container.read(lessonControllerProvider.notifier).nextStep();
      final state = container.read(lessonControllerProvider);
      expect(state.currentStepIndex, equals(1));
    });

    test('handleMove with correct move sets status to correct', () {
      // Advance to WaitForMoveStep
      container.read(lessonControllerProvider.notifier).nextStep();
      container
          .read(lessonControllerProvider.notifier)
          .handleMove('e4', 'e8');
      final state = container.read(lessonControllerProvider);
      expect(state.stepStatus, equals(LessonStepStatus.correct));
      expect(state.feedbackMessage, equals('Correct!'));
    });

    test('handleMove with wrong move sets status to incorrect', () {
      container.read(lessonControllerProvider.notifier).nextStep();
      container
          .read(lessonControllerProvider.notifier)
          .handleMove('e4', 'e5');
      final state = container.read(lessonControllerProvider);
      expect(state.stepStatus, equals(LessonStepStatus.incorrect));
      expect(state.wrongAttempts, equals(1));
      expect(state.totalWrongAttempts, equals(1));
    });

    test('showHint becomes true after 2 wrong attempts', () {
      container.read(lessonControllerProvider.notifier).nextStep();
      final notifier = container.read(lessonControllerProvider.notifier);
      notifier.handleMove('e4', 'e5');
      notifier.clearFeedback();
      notifier.handleMove('e4', 'e3');
      final state = container.read(lessonControllerProvider);
      expect(state.showHint, isTrue);
      expect(state.wrongAttempts, equals(2));
    });

    test('handleQuizAnswer with correct answer sets correct', () {
      final notifier = container.read(lessonControllerProvider.notifier);
      notifier.nextStep(); // -> WaitForMove
      notifier.handleMove('e4', 'e8'); // correct
      notifier.nextStep(); // -> Quiz
      notifier.handleQuizAnswer(1); // correct index
      final state = container.read(lessonControllerProvider);
      expect(state.stepStatus, equals(LessonStepStatus.correct));
    });

    test('handleQuizAnswer with wrong answer sets incorrect', () {
      final notifier = container.read(lessonControllerProvider.notifier);
      notifier.nextStep();
      notifier.handleMove('e4', 'e8');
      notifier.nextStep();
      notifier.handleQuizAnswer(0); // wrong
      final state = container.read(lessonControllerProvider);
      expect(state.stepStatus, equals(LessonStepStatus.incorrect));
    });

    test('completing last step sets isComplete and calculates stars', () {
      final notifier = container.read(lessonControllerProvider.notifier);
      notifier.nextStep(); // -> WaitForMove
      notifier.handleMove('e4', 'e8');
      notifier.nextStep(); // -> Quiz
      notifier.handleQuizAnswer(1);
      notifier.nextStep(); // -> last MascotSpeech
      notifier.nextStep(); // completes
      final state = container.read(lessonControllerProvider);
      expect(state.isComplete, isTrue);
      expect(state.starsEarned, equals(3)); // 0 wrong = 3 stars
    });

    test('wrong attempts reduce stars', () {
      final notifier = container.read(lessonControllerProvider.notifier);
      notifier.nextStep();
      notifier.handleMove('e4', 'e5'); // wrong
      notifier.clearFeedback();
      notifier.handleMove('e4', 'e3'); // wrong
      notifier.clearFeedback();
      notifier.handleMove('e4', 'e2'); // wrong
      notifier.clearFeedback();
      notifier.handleMove('e4', 'e8'); // correct
      notifier.nextStep();
      notifier.handleQuizAnswer(1);
      notifier.nextStep();
      notifier.nextStep(); // complete
      final state = container.read(lessonControllerProvider);
      expect(state.isComplete, isTrue);
      expect(state.starsEarned, equals(1)); // 3+ wrong = 1 star
    });

    test('progress returns correct fraction', () {
      final state0 = container.read(lessonControllerProvider);
      expect(state0.progress, equals(1 / 4));

      container.read(lessonControllerProvider.notifier).nextStep();
      final state1 = container.read(lessonControllerProvider);
      expect(state1.progress, equals(2 / 4));
    });
  });
}
