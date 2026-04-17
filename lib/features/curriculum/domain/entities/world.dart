import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'chapter.dart';

enum WorldId {
  theAwakening,
  theGathering,
  theTrainingGrounds,
  theCampaign,
  theFinalBattle,
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
          id: WorldId.theAwakening,
          name: 'The Awakening',
          subtitle: 'Discover the enchanted board',
          color: AppColors.world1,
          description:
              'You stumble into a magical chessboard world. Meet Sir Hops and discover the living chess pieces!',
          requiredXpToUnlock: 0,
          chapters: Chapter.world1Chapters,
        ),
        World(
          id: WorldId.theGathering,
          name: 'The Gathering',
          subtitle: 'Unite the army',
          color: AppColors.world2,
          description:
              'The Shadow threatens the kingdom! Master the rules of battle and rally your forces!',
          requiredXpToUnlock: 300,
          chapters: Chapter.world2Chapters,
        ),
        World(
          id: WorldId.theTrainingGrounds,
          name: 'The Training Grounds',
          subtitle: 'Sharpen your tactics',
          color: AppColors.world3,
          description:
              'Train with Sir Hops to master deadly tactics — forks, pins, and secret attacks!',
          requiredXpToUnlock: 1500,
          chapters: Chapter.world3Chapters,
        ),
        World(
          id: WorldId.theCampaign,
          name: 'The Campaign',
          subtitle: 'March to war',
          color: AppColors.world4,
          description:
              'Lead your army through dangerous territory toward the Shadow King!',
          requiredXpToUnlock: 4000,
          chapters: Chapter.world4Chapters,
        ),
        World(
          id: WorldId.theFinalBattle,
          name: 'The Final Battle',
          subtitle: 'Face the Shadow King',
          color: AppColors.world5,
          description:
              'Everything has led to this. Calculate, strategize, and defeat the Shadow King!',
          requiredXpToUnlock: 8000,
          chapters: Chapter.world5Chapters,
        ),
      ];
}
