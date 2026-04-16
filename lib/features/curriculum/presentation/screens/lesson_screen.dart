import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/animated_chessboard.dart';
import '../../data/lesson_content/content_registry.dart';
import '../../domain/entities/lesson.dart';
import '../../domain/entities/world.dart';
import '../../domain/entities/chapter.dart';
import '../providers/lesson_state_provider.dart';
import '../providers/chapter_progress_provider.dart';
import '../widgets/mascot_bubble.dart';
import '../widgets/feedback_overlay.dart';
import '../widgets/quiz_widget.dart';
import '../widgets/star_result_dialog.dart';

class LessonScreen extends ConsumerStatefulWidget {
  final String chapterId;

  const LessonScreen({super.key, required this.chapterId});

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> {
  int _currentLessonIndex = 0;
  late List<Lesson> _lessons;
  late Chapter _chapter;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    final chapter = _findChapter();
    if (chapter != null) {
      _chapter = chapter;
      _lessons = ContentRegistry.getLessons(widget.chapterId);
      _initialized = true;
      // Defer provider modification to after the build phase
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(activeLessonProvider.notifier).setLesson(_lessons[0]);
      });
    }
  }

  Chapter? _findChapter() {
    for (final world in World.all) {
      for (final chapter in world.chapters) {
        if (chapter.id == widget.chapterId) return chapter;
      }
    }
    return null;
  }

  void _startLesson(int index) {
    _currentLessonIndex = index;
    ref.read(activeLessonProvider.notifier).setLesson(_lessons[index]);
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Scaffold(body: Center(child: Text('Chapter not found')));
    }

    final lessonState = ref.watch(lessonControllerProvider);
    final controller = ref.read(lessonControllerProvider.notifier);
    final step = lessonState.currentStep;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_chapter.title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: lessonState.progress,
            backgroundColor: AppColors.surfaceVariant,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ),
      body: SafeArea(
        child: lessonState.isComplete
            ? _buildCompletionView(lessonState)
            : _buildStepView(step, lessonState, controller),
      ),
    );
  }

  Widget _buildStepView(
    LessonStep step,
    LessonState lessonState,
    LessonController controller,
  ) {
    return Stack(
      children: [
        Column(
          children: [
            // Lesson title bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Lesson ${_currentLessonIndex + 1}/${_lessons.length}',
                    style: AppTypography.caption,
                  ),
                  const Spacer(),
                  Text(
                    lessonState.lesson.title,
                    style: AppTypography.bodySmall
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            // Board area
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildBoardForStep(step, controller),
                ),
              ),
            ),

            // Bottom area: mascot speech / quiz / controls
            _buildBottomArea(step, lessonState, controller),
          ],
        ),

        // Feedback overlay
        if (lessonState.feedbackMessage != null)
          FeedbackOverlay(
            message: lessonState.feedbackMessage!,
            type: lessonState.feedbackType ?? 'info',
            onDismiss: () {
              if (lessonState.stepStatus == LessonStepStatus.correct) {
                controller.nextStep();
              } else {
                controller.clearFeedback();
              }
            },
          ),
      ],
    );
  }

  Widget _buildBoardForStep(LessonStep step, LessonController controller) {
    String fen = '8/8/8/8/8/8/8/8 w - - 0 1';
    List<String> highlights = [];
    List<String> dangers = [];
    List<String> objectives = [];
    List<String> hints = [];
    List<(String, String)> arrows = [];
    bool interactable = false;
    void Function(String, String)? onMove;
    void Function(String)? onSquareTap;

    switch (step) {
      case ShowPositionStep s:
        fen = s.fen;
        highlights = s.highlightSquares;
        dangers = s.dangerSquares;
        objectives = s.objectiveSquares;
        arrows = s.arrows;
      case WaitForMoveStep s:
        fen = s.fen;
        highlights = s.highlightSquares;
        arrows = s.hintArrows;
        interactable = true;
        onMove = controller.handleMove;
      case WaitForTapStep s:
        fen = s.fen;
        objectives = [s.targetSquare];
        onSquareTap = controller.handleTap;
      case MascotSpeechStep s:
        fen = s.fen ??
            'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
      case FreePlayStep s:
        fen = s.fen;
        interactable = true;
      case CaptureChallenge s:
        fen = s.fen;
        interactable = true;
      case AnimateMoveStep s:
        fen = s.fen ?? '8/8/8/8/8/8/8/8 w - - 0 1';
        arrows = [(s.from, s.to)];
      case QuizStep s:
        fen = s.fen ?? '8/8/8/8/8/8/8/8 w - - 0 1';
      case CoordinateQuiz():
        fen = '8/8/8/8/8/8/8/8 w - - 0 1';
    }

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedChessboard(
        fen: fen,
        interactable: interactable,
        showCoordinates: true,
        highlightSquares: highlights,
        dangerSquares: dangers,
        objectiveSquares: objectives,
        hintSquares: hints,
        arrows: arrows,
        onMove: onMove,
        onSquareTap: onSquareTap,
      ),
    );
  }

  Widget _buildBottomArea(
    LessonStep step,
    LessonState lessonState,
    LessonController controller,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Step-specific content
        switch (step) {
          MascotSpeechStep s => MascotBubble(
              message: s.message,
              emotion: s.emotion,
            ),
          ShowPositionStep s => MascotBubble(
              message: s.message ?? '',
              emotion: 'explaining',
            ),
          WaitForMoveStep s => MascotBubble(
              message: lessonState.showHint
                  ? s.hintMessage ?? 'Try moving a piece!'
                  : 'Your turn! Make a move on the board.',
              emotion: lessonState.showHint ? 'thinking' : 'encouraging',
            ),
          WaitForTapStep s => MascotBubble(
              message: s.message ?? 'Tap the correct square!',
              emotion: 'explaining',
            ),
          QuizStep s => QuizWidget(
              question: s.question,
              options: s.options,
              onAnswer: controller.handleQuizAnswer,
              correctIndex:
                  lessonState.stepStatus == LessonStepStatus.correct
                      ? s.correctIndex
                      : null,
            ),
          CaptureChallenge s => MascotBubble(
              message: s.message ?? 'Capture all the targets!',
              emotion: 'excited',
            ),
          FreePlayStep s => MascotBubble(
              message: s.message ?? 'Move freely! Explore!',
              emotion: 'happy',
            ),
          AnimateMoveStep s => MascotBubble(
              message: s.message ?? 'Watch this move!',
              emotion: 'explaining',
            ),
          CoordinateQuiz() => MascotBubble(
              message: 'Tap the square!',
              emotion: 'excited',
            ),
        },

        // Navigation button
        if (step is MascotSpeechStep ||
            step is ShowPositionStep ||
            step is FreePlayStep ||
            step is AnimateMoveStep)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.nextStep,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  lessonState.isLastStep ? 'Complete!' : 'Continue',
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCompletionView(LessonState lessonState) {
    return StarResultDialog(
      stars: lessonState.starsEarned,
      xpEarned: lessonState.lesson.xpReward,
      onContinue: () {
        if (_currentLessonIndex < _lessons.length - 1) {
          setState(() {
            _startLesson(_currentLessonIndex + 1);
          });
        } else {
          // All lessons in chapter complete - save progress
          final saver = ref.read(progressSaverProvider.notifier);
          saver.completeLesson(
            chapterId: widget.chapterId,
            stars: lessonState.starsEarned,
            xpEarned: _chapter.xpReward,
          );
          saver.unlockNextChapter(widget.chapterId);
          context.pop();
        }
      },
      isLastLesson: _currentLessonIndex >= _lessons.length - 1,
    );
  }
}
