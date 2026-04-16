import 'package:bishop/bishop.dart' as bishop;
import 'package:flutter/material.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';

import '../constants/app_colors.dart';
import '../utils/sound_manager.dart';

/// Custom chessboard widget wrapping the `squares` package with
/// highlighting, arrows, animations, and guided-mode support.
class AnimatedChessboard extends StatefulWidget {
  final String fen;
  final bool interactable;
  final bool showCoordinates;
  final List<String> highlightSquares;
  final List<String> dangerSquares;
  final List<String> objectiveSquares;
  final List<String> hintSquares;
  final List<(String from, String to)> arrows;
  final void Function(String from, String to)? onMove;
  final void Function(String square)? onSquareTap;
  final Set<String>? allowedMoves;

  const AnimatedChessboard({
    super.key,
    required this.fen,
    this.interactable = false,
    this.showCoordinates = true,
    this.highlightSquares = const [],
    this.dangerSquares = const [],
    this.objectiveSquares = const [],
    this.hintSquares = const [],
    this.arrows = const [],
    this.onMove,
    this.onSquareTap,
    this.allowedMoves,
  });

  @override
  State<AnimatedChessboard> createState() => _AnimatedChessboardState();
}

class _AnimatedChessboardState extends State<AnimatedChessboard> {
  late bishop.Game _game;
  int _player = bishop.Bishop.white;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  @override
  void didUpdateWidget(AnimatedChessboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fen != widget.fen) {
      _initGame();
    }
  }

  void _initGame() {
    _game = bishop.Game(fen: widget.fen);
    _player = bishop.Bishop.white;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

        // Use square_bishop extensions to get squares-compatible state
        final boardState = _game.boardState(_player);
        final squaresMoves = widget.interactable
            ? _game.squaresMoves(_player)
            : <Move>[];
        final playState = widget.interactable
            ? _game.playState(_player)
            : PlayState.observing;

        return SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              // Main board
              BoardController(
                state: boardState,
                playState: playState,
                pieceSet: PieceSet.merida(),
                moves: squaresMoves,
                theme: BoardTheme(
                  lightSquare: AppColors.boardLight,
                  darkSquare: AppColors.boardDark,
                  check: AppColors.boardDanger,
                  checkmate: AppColors.error,
                  previous: AppColors.boardLastMove,
                  selected: AppColors.boardHighlight,
                  premove: AppColors.boardHint,
                ),
                onMove: widget.interactable ? _handleMove : null,
              ),

              // Highlight overlay
              if (widget.highlightSquares.isNotEmpty ||
                  widget.dangerSquares.isNotEmpty ||
                  widget.objectiveSquares.isNotEmpty ||
                  widget.hintSquares.isNotEmpty)
                IgnorePointer(
                  child: CustomPaint(
                    size: Size(boardSize, boardSize),
                    painter: _SquareHighlightPainter(
                      boardSize: boardSize,
                      highlights: widget.highlightSquares,
                      dangers: widget.dangerSquares,
                      objectives: widget.objectiveSquares,
                      hints: widget.hintSquares,
                    ),
                  ),
                ),

              // Arrow overlay
              if (widget.arrows.isNotEmpty)
                IgnorePointer(
                  child: CustomPaint(
                    size: Size(boardSize, boardSize),
                    painter: _ArrowPainter(
                      boardSize: boardSize,
                      arrows: widget.arrows,
                    ),
                  ),
                ),

              // Coordinate labels
              if (widget.showCoordinates)
                IgnorePointer(
                  child: CustomPaint(
                    size: Size(boardSize, boardSize),
                    painter: _CoordinatePainter(boardSize: boardSize),
                  ),
                ),

              // Square tap detection overlay
              if (widget.onSquareTap != null)
                GestureDetector(
                  onTapUp: (details) {
                    final squareSize = boardSize / 8;
                    final file = (details.localPosition.dx / squareSize).floor();
                    final rank = 7 - (details.localPosition.dy / squareSize).floor();
                    if (file >= 0 && file < 8 && rank >= 0 && rank < 8) {
                      final square = '${String.fromCharCode('a'.codeUnitAt(0) + file)}${rank + 1}';
                      widget.onSquareTap!(square);
                    }
                  },
                  child: Container(
                    width: boardSize,
                    height: boardSize,
                    color: const Color(0x00000000), // Transparent but tappable
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _handleMove(Move move) {
    final from = _squareIndexToAlgebraic(move.from);
    final to = _squareIndexToAlgebraic(move.to);

    // Check if move is allowed in guided mode
    if (widget.allowedMoves != null &&
        !widget.allowedMoves!.contains('$from$to')) {
      return;
    }

    // Apply the move using square_bishop bridge
    final isCapture = _game.board[move.to].isNotEmpty;
    setState(() {
      _game.makeSquaresMove(move);
    });
    SoundManager().playMoveSound(isCapture: isCapture, isCheck: _game.inCheck);

    widget.onMove?.call(from, to);
  }

  String _squareIndexToAlgebraic(int index) {
    final file = String.fromCharCode('a'.codeUnitAt(0) + (index % 8));
    final rank = (index ~/ 8) + 1;
    return '$file$rank';
  }
}

class _SquareHighlightPainter extends CustomPainter {
  final double boardSize;
  final List<String> highlights;
  final List<String> dangers;
  final List<String> objectives;
  final List<String> hints;

  _SquareHighlightPainter({
    required this.boardSize,
    this.highlights = const [],
    this.dangers = const [],
    this.objectives = const [],
    this.hints = const [],
  });

  @override
  void paint(Canvas canvas, Size size) {
    final squareSize = boardSize / 8;

    void drawSquares(List<String> squares, Color color) {
      final paint = Paint()..color = color;
      for (final sq in squares) {
        final (file, rank) = _parseSquare(sq);
        if (file < 0) continue;
        final rect = Rect.fromLTWH(
          file * squareSize,
          (7 - rank) * squareSize,
          squareSize,
          squareSize,
        );
        canvas.drawRect(rect, paint);
      }
    }

    drawSquares(highlights, AppColors.boardHighlight);
    drawSquares(dangers, AppColors.boardDanger);
    drawSquares(objectives, AppColors.boardObjective);
    drawSquares(hints, AppColors.boardHint);
  }

  (int, int) _parseSquare(String square) {
    if (square.length != 2) return (-1, -1);
    final file = square.codeUnitAt(0) - 'a'.codeUnitAt(0);
    final rank = int.tryParse(square[1]);
    if (rank == null || file < 0 || file > 7 || rank < 1 || rank > 8) {
      return (-1, -1);
    }
    return (file, rank - 1);
  }

  @override
  bool shouldRepaint(covariant _SquareHighlightPainter oldDelegate) =>
      highlights != oldDelegate.highlights ||
      dangers != oldDelegate.dangers ||
      objectives != oldDelegate.objectives ||
      hints != oldDelegate.hints;
}

class _ArrowPainter extends CustomPainter {
  final double boardSize;
  final List<(String from, String to)> arrows;

  _ArrowPainter({required this.boardSize, required this.arrows});

  @override
  void paint(Canvas canvas, Size size) {
    final squareSize = boardSize / 8;
    final paint = Paint()
      ..color = AppColors.primary.withAlpha(180)
      ..strokeWidth = squareSize * 0.15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (final (from, to) in arrows) {
      final (ff, fr) = _parseSquare(from);
      final (tf, tr) = _parseSquare(to);
      if (ff < 0 || tf < 0) continue;

      final fromCenter = Offset(
        (ff + 0.5) * squareSize,
        (7 - fr + 0.5) * squareSize,
      );
      final toCenter = Offset(
        (tf + 0.5) * squareSize,
        (7 - tr + 0.5) * squareSize,
      );

      canvas.drawLine(fromCenter, toCenter, paint);

      // Draw arrowhead
      final direction = (toCenter - fromCenter);
      final normalized = direction / direction.distance;
      final arrowSize = squareSize * 0.25;
      final perpendicular = Offset(-normalized.dy, normalized.dx);

      final arrowPath = Path()
        ..moveTo(toCenter.dx, toCenter.dy)
        ..lineTo(
          toCenter.dx -
              normalized.dx * arrowSize +
              perpendicular.dx * arrowSize * 0.6,
          toCenter.dy -
              normalized.dy * arrowSize +
              perpendicular.dy * arrowSize * 0.6,
        )
        ..lineTo(
          toCenter.dx -
              normalized.dx * arrowSize -
              perpendicular.dx * arrowSize * 0.6,
          toCenter.dy -
              normalized.dy * arrowSize -
              perpendicular.dy * arrowSize * 0.6,
        )
        ..close();

      canvas.drawPath(
        arrowPath,
        Paint()..color = AppColors.primary.withAlpha(180),
      );
    }
  }

  (int, int) _parseSquare(String square) {
    if (square.length != 2) return (-1, -1);
    final file = square.codeUnitAt(0) - 'a'.codeUnitAt(0);
    final rank = int.tryParse(square[1]);
    if (rank == null || file < 0 || file > 7 || rank < 1 || rank > 8) {
      return (-1, -1);
    }
    return (file, rank - 1);
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) =>
      arrows != oldDelegate.arrows;
}

class _CoordinatePainter extends CustomPainter {
  final double boardSize;

  _CoordinatePainter({required this.boardSize});

  @override
  void paint(Canvas canvas, Size size) {
    final squareSize = boardSize / 8;
    const files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];

    for (var i = 0; i < 8; i++) {
      final fileTP = TextPainter(
        text: TextSpan(
          text: files[i],
          style: TextStyle(
            color: i % 2 == 0 ? AppColors.boardDark : AppColors.boardLight,
            fontSize: squareSize * 0.16,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      fileTP.paint(
        canvas,
        Offset(
          (i + 1) * squareSize - fileTP.width - 2,
          boardSize - fileTP.height - 2,
        ),
      );

      final rankTP = TextPainter(
        text: TextSpan(
          text: '${8 - i}',
          style: TextStyle(
            color: i % 2 == 0 ? AppColors.boardDark : AppColors.boardLight,
            fontSize: squareSize * 0.16,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      rankTP.paint(canvas, Offset(2, i * squareSize + 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
