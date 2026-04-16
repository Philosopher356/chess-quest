import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages all app audio: move sounds, UI sounds, and background music.
class SoundManager {
  static final SoundManager _instance = SoundManager._internal();
  factory SoundManager() => _instance;
  SoundManager._internal();

  final Map<String, AudioPlayer> _players = {};
  AudioPlayer? _musicPlayer;
  bool _soundEnabled = true;
  bool _musicEnabled = true;
  bool _initialized = false;

  bool get soundEnabled => _soundEnabled;
  bool get musicEnabled => _musicEnabled;

  Future<void> init() async {
    if (_initialized) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      _soundEnabled = prefs.getBool('sound_enabled') ?? true;
      _musicEnabled = prefs.getBool('music_enabled') ?? true;
      _initialized = true;
    } catch (e) {
      debugPrint('SoundManager init error: $e');
    }
  }

  Future<void> setSoundEnabled(bool enabled) async {
    _soundEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sound_enabled', enabled);
  }

  Future<void> setMusicEnabled(bool enabled) async {
    _musicEnabled = enabled;
    if (!enabled) {
      await _musicPlayer?.stop();
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('music_enabled', enabled);
  }

  /// Play a short sound effect.
  Future<void> play(SoundEffect effect) async {
    if (!_soundEnabled) return;
    try {
      var player = _players[effect.name];
      if (player == null) {
        player = AudioPlayer();
        _players[effect.name] = player;
      }
      await player.setAsset(effect.assetPath);
      await player.seek(Duration.zero);
      await player.play();
    } catch (e) {
      debugPrint('Sound play error: $e');
    }
  }

  /// Play a move sound based on the move type.
  Future<void> playMoveSound({bool isCapture = false, bool isCheck = false}) {
    if (isCheck) return play(SoundEffect.check);
    if (isCapture) return play(SoundEffect.capture);
    return play(SoundEffect.move);
  }

  /// Play celebration sound.
  Future<void> playSuccess() => play(SoundEffect.success);
  Future<void> playError() => play(SoundEffect.error);
  Future<void> playLevelUp() => play(SoundEffect.levelUp);
  Future<void> playAchievement() => play(SoundEffect.achievement);
  Future<void> playStar() => play(SoundEffect.star);

  Future<void> dispose() async {
    for (final player in _players.values) {
      await player.dispose();
    }
    _players.clear();
    await _musicPlayer?.dispose();
    _musicPlayer = null;
  }
}

/// Sound effects available in the app.
/// Asset paths point to where audio files would be placed.
enum SoundEffect {
  move('assets/audio/move.wav'),
  capture('assets/audio/capture.wav'),
  check('assets/audio/check.wav'),
  checkmate('assets/audio/checkmate.wav'),
  success('assets/audio/success.wav'),
  error('assets/audio/error.wav'),
  levelUp('assets/audio/level_up.wav'),
  achievement('assets/audio/achievement.wav'),
  star('assets/audio/star.wav'),
  buttonTap('assets/audio/tap.wav'),
  coinEarn('assets/audio/coin.wav'),
  xpGain('assets/audio/xp.wav');

  const SoundEffect(this.assetPath);
  final String assetPath;
}
