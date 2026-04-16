import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'chapter.dart';

enum WorldId {
  theKingdom,
  rulesOfBattle,
  theStrategist,
  grandmastersPath,
  mastersDomain,
}

class World {
  final WorldId id;
  final String name;
  final String subtitle;
  final Color color;
  final String description;
  final List<Chapter> chapters;
  final int requiredXpToUnlock;

  const World({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.color,
    required this.description,
    required this.chapters,
    this.requiredXpToUnlock = 0,
  });

  static List<World> get all => [
        World(
          id: WorldId.theKingdom,
          name: 'The Kingdom',
          subtitle: 'Learn the pieces',
          color: AppColors.world1,
          description: 'Meet the chess pieces and learn how they move!',
          requiredXpToUnlock: 0,
          chapters: Chapter.world1Chapters,
        ),
        World(
          id: WorldId.rulesOfBattle,
          name: 'Rules of Battle',
          subtitle: 'Master the rules',
          color: AppColors.world2,
          description: 'Learn check, checkmate, and special moves!',
          requiredXpToUnlock: 300,
          chapters: Chapter.world2Chapters,
        ),
        World(
          id: WorldId.theStrategist,
          name: 'The Strategist',
          subtitle: 'Think like a tactician',
          color: AppColors.world3,
          description: 'Discover powerful tactics and opening secrets!',
          requiredXpToUnlock: 1500,
          chapters: Chapter.world3Chapters,
        ),
        World(
          id: WorldId.grandmastersPath,
          name: "Grandmaster's Path",
          subtitle: 'Advanced strategy',
          color: AppColors.world4,
          description: 'Master pawn structures, endgames, and deep strategy!',
          requiredXpToUnlock: 4000,
          chapters: Chapter.world4Chapters,
        ),
        World(
          id: WorldId.mastersDomain,
          name: "Master's Domain",
          subtitle: 'Expert mastery',
          color: AppColors.world5,
          description: 'Calculate like a grandmaster!',
          requiredXpToUnlock: 8000,
          chapters: Chapter.world5Chapters,
        ),
      ];
}
