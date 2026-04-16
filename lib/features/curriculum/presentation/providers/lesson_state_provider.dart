import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/lesson.dart';

/// The current state of a lesson being played.
class LessonState {
  final Lesson lesson;
  final int currentStepIndex;
  final LessonStepStatus stepStatus;
  final int wrongAttempts;
  final int totalWrongAttempts;
  final bool showHint;
  final bool isComplete;
  final int starsEarned;
  final String? feedbackMessage;
  final String? feedbackType; // 'success', 'error', 'hint'

  const LessonState({
    required this.lesson,
    this.currentStepIndex = 0,
    this.stepStatus = LessonStepStatus.active,
    this.wrongAttempts = 0,
    this.totalWrongAttempts = 0,
    this.showHint = false,
    this.isComplete = false,
    this.starsEarned = 0,
    this.feedbackMessage,
    this.feedbackType,
  });

  LessonStep get currentStep => lesson.steps[currentStepIndex];
  bool get isLastStep => currentStepIndex >= lesson.steps.length - 1;
  double get progress => lesson.steps.isEmpty
      ? 1.0
      : (currentStepIndex + 1) / lesson.steps.length;

  LessonState copyWith({
    int? currentStepIndex,
    LessonStepStatus? stepStatus,
    int? wrongAttempts,
    int? totalWrongAttempts,
    bool? showHint,
    bool? isComplete,
    int? starsEarned,
    String? feedbackMessage,
    String? feedbackType,
  }) {
    return LessonState(
      lesson: lesson,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      stepStatus: stepStatus ?? this.stepStatus,
      wrongAttempts: wrongAttempts ?? this.wrongAttempts,
      totalWrongAttempts: totalWrongAttempts ?? this.totalWrongAttempts,
      showHint: showHint ?? this.showHint,
      isComplete: isComplete ?? this.isComplete,
      starsEarned: starsEarned ?? this.starsEarned,
      feedbackMessage: feedbackMessage,
      feedbackType: feedbackType,
    );
  }
}

enum LessonStepStatus {
  active,
  waitingForInput,
  correct,
  incorrect,
  complete,
}

/// Holds which lesson is currently being played.
class ActiveLessonNotifier extends Notifier<Lesson?> {
  @override
  Lesson? build() => null;

  void setLesson(Lesson lesson) => state = lesson;
  void clear() => state = null;
}

final activeLessonProvider =
    NotifierProvider<ActiveLessonNotifier, Lesson?>(ActiveLessonNotifier.new);

/// Manages the state machine for stepping through a lesson.
class LessonController extends Notifier<LessonState> {
  static final _placeholder = Lesson(
    id: '',
    title: '',
    description: '',
    steps: [const MascotSpeechStep(message: 'Loading...')],
  );

  @override
  LessonState build() {
    final lesson = ref.watch(activeLessonProvider);
    return LessonState(lesson: lesson ?? _placeholder);
  }

  /// Advance to the next step.
  void nextStep() {
    if (state.isLastStep) {
      _completeLesson();
      return;
    }

    state = state.copyWith(
      currentStepIndex: state.currentStepIndex + 1,
      stepStatus: LessonStepStatus.active,
      wrongAttempts: 0,
      showHint: false,
      feedbackMessage: null,
      feedbackType: null,
    );
  }

  /// Handle the player making a move on a WaitForMoveStep.
  void handleMove(String from, String to) {
    final step = state.currentStep;
    if (step is! WaitForMoveStep) return;

    final isCorrect = step.acceptedMoves.any(
      (m) => m.$1 == from && m.$2 == to,
    );

    if (isCorrect) {
      state = state.copyWith(
        stepStatus: LessonStepStatus.correct,
        feedbackMessage: step.successMessage ?? 'Great move!',
        feedbackType: 'success',
      );
    } else {
      final attempts = state.wrongAttempts + 1;
      state = state.copyWith(
        stepStatus: LessonStepStatus.incorrect,
        wrongAttempts: attempts,
        totalWrongAttempts: state.totalWrongAttempts + 1,
        showHint: attempts >= 2,
        feedbackMessage: step.failMessage ?? 'Try again!',
        feedbackType: 'error',
      );
    }
  }

  /// Handle the player tapping a square on a WaitForTapStep.
  void handleTap(String square) {
    final step = state.currentStep;
    if (step is! WaitForTapStep) return;

    if (square == step.targetSquare) {
      state = state.copyWith(
        stepStatus: LessonStepStatus.correct,
        feedbackMessage: step.successMessage ?? 'Correct!',
        feedbackType: 'success',
      );
    } else {
      final attempts = state.wrongAttempts + 1;
      state = state.copyWith(
        stepStatus: LessonStepStatus.incorrect,
        wrongAttempts: attempts,
        totalWrongAttempts: state.totalWrongAttempts + 1,
        showHint: attempts >= 2,
        feedbackMessage: step.hintMessage ?? 'Not quite, try again!',
        feedbackType: 'error',
      );
    }
  }

  /// Handle quiz answer selection.
  void handleQuizAnswer(int selectedIndex) {
    final step = state.currentStep;
    if (step is! QuizStep) return;

    if (selectedIndex == step.correctIndex) {
      state = state.copyWith(
        stepStatus: LessonStepStatus.correct,
        feedbackMessage: step.explanation ?? 'Correct!',
        feedbackType: 'success',
      );
    } else {
      state = state.copyWith(
        stepStatus: LessonStepStatus.incorrect,
        wrongAttempts: state.wrongAttempts + 1,
        totalWrongAttempts: state.totalWrongAttempts + 1,
        feedbackMessage: 'Not quite! Try again.',
        feedbackType: 'error',
      );
    }
  }

  /// Reset step status back to active (after showing feedback).
  void clearFeedback() {
    state = state.copyWith(
      stepStatus: LessonStepStatus.active,
      feedbackMessage: null,
      feedbackType: null,
    );
  }

  void _completeLesson() {
    final totalWrong = state.totalWrongAttempts;
    final stars = totalWrong == 0
        ? 3
        : totalWrong <= 2
            ? 2
            : 1;

    state = state.copyWith(
      isComplete: true,
      starsEarned: stars,
      stepStatus: LessonStepStatus.complete,
    );
  }
}

final lessonControllerProvider =
    NotifierProvider<LessonController, LessonState>(LessonController.new);
