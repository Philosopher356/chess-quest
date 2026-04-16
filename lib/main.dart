import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/sound_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SoundManager().init();
  runApp(const App());
}
