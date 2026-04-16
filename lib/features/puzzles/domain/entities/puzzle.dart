class ChessPuzzle {
  final String id;
  final String fen;
  final List<String> solution; // Sequence of moves e.g. ['e2e4', 'e7e5', 'f1c4']
  final String theme; // fork, pin, mate_in_1, etc.
  final int rating;
  final String? description;

  const ChessPuzzle({
    required this.id,
    required this.fen,
    required this.solution,
    required this.theme,
    required this.rating,
    this.description,
  });
}
