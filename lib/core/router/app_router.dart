import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/profile_selection_screen.dart';
import '../../features/auth/presentation/screens/create_profile_screen.dart';
import '../../features/curriculum/presentation/screens/world_map_screen.dart';
import '../../features/curriculum/presentation/screens/chapter_list_screen.dart';
import '../../features/curriculum/presentation/screens/lesson_screen.dart';
import '../../features/puzzles/presentation/screens/puzzle_hub_screen.dart';
import '../../features/puzzles/presentation/screens/puzzle_screen.dart';
import '../../features/play/presentation/screens/play_hub_screen.dart';
import '../../features/play/presentation/screens/game_screen.dart';
import '../../features/gamification/presentation/screens/profile_hub_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/parent_dashboard/presentation/screens/parent_dashboard_screen.dart';
import '../widgets/home_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/profiles',
  routes: [
    GoRoute(
      path: '/profiles',
      builder: (context, state) => const ProfileSelectionScreen(),
    ),
    GoRoute(
      path: '/profiles/create',
      builder: (context, state) => const CreateProfileScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(
          path: '/learn',
          builder: (context, state) => const WorldMapScreen(),
          routes: [
            GoRoute(
              path: ':worldId',
              builder: (context, state) => ChapterListScreen(
                worldIndex: int.parse(state.pathParameters['worldId']!),
              ),
              routes: [
                GoRoute(
                  path: ':chapterId',
                  builder: (context, state) => LessonScreen(
                    chapterId: state.pathParameters['chapterId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/puzzles',
          builder: (context, state) => const PuzzleHubScreen(),
          routes: [
            GoRoute(
              path: 'train',
              builder: (context, state) => const PuzzleScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/play',
          builder: (context, state) => const PlayHubScreen(),
          routes: [
            GoRoute(
              path: 'game',
              builder: (context, state) => const GameScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileHubScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/parent',
      builder: (context, state) => const ParentDashboardScreen(),
    ),
  ],
);
