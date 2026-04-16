import '../../domain/entities/lesson.dart';
import 'chapter1_chessboard.dart';
import 'chapter2_pawns.dart';
import 'chapter3_rook.dart';
import 'chapter4_bishop.dart';
import 'chapter5_queen.dart';
import 'chapter6_knight.dart';
import 'chapter7_king.dart';
import 'chapter8_setup.dart';
import 'chapter9_check.dart';
import 'chapter10_checkmate.dart';
import 'chapter11_stalemate.dart';
import 'chapter12_special_moves.dart';
import 'chapter13_piece_values.dart';
import 'chapter14_openings.dart';
import 'chapter15_forks.dart';
import 'chapter16_pins_skewers.dart';
import 'chapter17_discovered.dart';
import 'chapter18_advanced_tactics.dart';
import 'chapter19_mate_patterns.dart';
import 'chapter20_pawn_structure.dart';
import 'chapter21_piece_activity.dart';
import 'chapter22_king_safety.dart';
import 'chapter23_endgames.dart';
import 'chapter24_complex_endgames.dart';
import 'chapter25_positional.dart';
import 'chapter26_calculation.dart';
import 'chapter27_patterns.dart';
import 'chapter28_complete_games.dart';

/// Central registry mapping chapter IDs to their lesson content.
class ContentRegistry {
  ContentRegistry._();

  static final Map<String, List<Lesson>> _content = {
    // World 1: The Kingdom
    'ch1': Chapter1Content.lessons,
    'ch2': Chapter2Content.lessons,
    'ch3': Chapter3Content.lessons,
    'ch4': Chapter4Content.lessons,
    'ch5': Chapter5Content.lessons,
    'ch6': Chapter6Content.lessons,
    'ch7': Chapter7Content.lessons,
    // World 2: Rules of Battle
    'ch8': Chapter8Content.lessons,
    'ch9': Chapter9Content.lessons,
    'ch10': Chapter10Content.lessons,
    'ch11': Chapter11Content.lessons,
    'ch12': Chapter12Content.lessons,
    'ch13': Chapter13Content.lessons,
    // World 3: The Strategist
    'ch14': Chapter14Content.lessons,
    'ch15': Chapter15Content.lessons,
    'ch16': Chapter16Content.lessons,
    'ch17': Chapter17Content.lessons,
    'ch18': Chapter18Content.lessons,
    'ch19': Chapter19Content.lessons,
    // World 4: Grandmaster's Path
    'ch20': Chapter20Content.lessons,
    'ch21': Chapter21Content.lessons,
    'ch22': Chapter22Content.lessons,
    'ch23': Chapter23Content.lessons,
    // World 5: Master's Domain
    'ch24': Chapter24Content.lessons,
    'ch25': Chapter25Content.lessons,
    'ch26': Chapter26Content.lessons,
    'ch27': Chapter27Content.lessons,
    'ch28': Chapter28Content.lessons,
  };

  static List<Lesson> getLessons(String chapterId) {
    return _content[chapterId] ?? _placeholderLessons(chapterId);
  }

  static Lesson? getLesson(String lessonId) {
    for (final lessons in _content.values) {
      for (final lesson in lessons) {
        if (lesson.id == lessonId) return lesson;
      }
    }
    return null;
  }

  static bool hasContent(String chapterId) {
    return _content.containsKey(chapterId);
  }

  static int get totalLessonCount {
    return _content.values.fold(0, (sum, lessons) => sum + lessons.length);
  }

  static List<Lesson> _placeholderLessons(String chapterId) {
    return [
      Lesson(
        id: '${chapterId}_placeholder',
        title: 'Coming Soon!',
        description: 'This lesson is still being built.',
        steps: const [
          MascotSpeechStep(
            message: "This chapter is coming soon!",
            emotion: 'thinking',
          ),
        ],
      ),
    ];
  }
}
