import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/engine/data/engine_factory.dart';
import '../../features/engine/domain/engine_interface.dart';

final engineProvider = Provider<ChessEngine>((ref) {
  final engine = createEngine();
  engine.init();
  ref.onDispose(() => engine.dispose());
  return engine;
});
