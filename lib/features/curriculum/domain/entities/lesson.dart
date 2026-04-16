/// Represents a single step in an interactive lesson.
sealed class LessonStep {
  const LessonStep();
}

/// Show a board position with optional highlights and arrows.
class ShowPositionStep extends LessonStep {
  final String fen;
  final List<String> highlightSquares;
  final List<String> dangerSquares;
  final List<String> objectiveSquares;
  final List<(String, String)> arrows;
  final String? message;
  final bool autoAdvance;
  final Duration autoAdvanceDelay;

  const ShowPositionStep({
    required this.fen,
    this.highlightSquares = const [],
    this.dangerSquares = const [],
    this.objectiveSquares = const [],
    this.arrows = const [],
    this.message,
    this.autoAdvance = false,
    this.autoAdvanceDelay = const Duration(seconds: 2),
  });
}

/// Animate a piece moving on the board, then advance.
class AnimateMoveStep extends LessonStep {
  final String from;
  final String to;
  final String? message;
  final String? fen; // Position before the move (if different from current)

  const AnimateMoveStep({
    required this.from,
    required this.to,
    this.message,
    this.fen,
  });
}

/// Wait for the player to make a specific move (or one of several valid moves).
class WaitForMoveStep extends LessonStep {
  final String fen;
  final List<(String from, String to)> acceptedMoves;
  final String? hintMessage;
  final String? successMessage;
  final String? failMessage;
  final bool showValidMoves;
  final List<String> highlightSquares;
  final List<(String, String)> hintArrows;

  const WaitForMoveStep({
    required this.fen,
    required this.acceptedMoves,
    this.hintMessage,
    this.successMessage,
    this.failMessage,
    this.showValidMoves = true,
    this.highlightSquares = const [],
    this.hintArrows = const [],
  });
}

/// Wait for the player to tap a specific square.
class WaitForTapStep extends LessonStep {
  final String fen;
  final String targetSquare;
  final String? message;
  final String? hintMessage;
  final String? successMessage;

  const WaitForTapStep({
    required this.fen,
    required this.targetSquare,
    this.message,
    this.hintMessage,
    this.successMessage,
  });
}

/// Show a text message from the mascot. Tap to advance.
class MascotSpeechStep extends LessonStep {
  final String message;
  final String emotion; // happy, thinking, excited, encouraging, explaining
  final String? fen; // Optional board state to show alongside

  const MascotSpeechStep({
    required this.message,
    this.emotion = 'happy',
    this.fen,
  });
}

/// Free exploration mode -- let the child move pieces freely.
class FreePlayStep extends LessonStep {
  final String fen;
  final String? message;
  final Duration? duration;
  final String? completionMessage;

  const FreePlayStep({
    required this.fen,
    this.message,
    this.duration,
    this.completionMessage,
  });
}

/// A multiple choice question.
class QuizStep extends LessonStep {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String? explanation;
  final String? fen; // Optional board position for context

  const QuizStep({
    required this.question,
    required this.options,
    required this.correctIndex,
    this.explanation,
    this.fen,
  });
}

/// A capture challenge: capture all target pieces in minimum moves.
class CaptureChallenge extends LessonStep {
  final String fen;
  final int targetMoves; // Par for 3 stars
  final String? message;
  final String piece; // Which piece the player controls (e.g. 'R' for rook)

  const CaptureChallenge({
    required this.fen,
    required this.targetMoves,
    this.message,
    required this.piece,
  });
}

/// A coordinate quiz: tap the named square quickly.
class CoordinateQuiz extends LessonStep {
  final List<String> targetSquares; // Sequence of squares to tap
  final int timeLimitSeconds;
  final int requiredCorrect; // e.g. 8 out of 10

  const CoordinateQuiz({
    required this.targetSquares,
    this.timeLimitSeconds = 30,
    required this.requiredCorrect,
  });
}

/// A lesson that contains a sequence of interactive steps.
class Lesson {
  final String id;
  final String title;
  final String description;
  final List<LessonStep> steps;
  final bool isMiniGame;
  final int xpReward;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.steps,
    this.isMiniGame = false,
    this.xpReward = 20,
  });
}
