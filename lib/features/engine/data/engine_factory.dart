import 'package:flutter/foundation.dart' show kIsWeb;

import '../domain/engine_interface.dart';
import 'dart_minimax_engine.dart';

/// Creates the appropriate chess engine for the current platform.
/// Web gets the pure Dart minimax engine.
/// Mobile gets Stockfish (when implemented) or falls back to Dart minimax.
ChessEngine createEngine() {
  if (kIsWeb) {
    return DartMinimaxEngine();
  }
  // TODO: Return StockfishEngine() when stockfish_chess_engine is integrated
  // For now, use Dart engine on all platforms
  return DartMinimaxEngine();
}
