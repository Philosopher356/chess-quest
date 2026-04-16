class PlayerProfile {
  final int id;
  final String name;
  final int avatarId;
  final int age;
  final DateTime createdAt;
  final int totalXp;
  final int currentRank;
  final int coinBalance;
  final int puzzleRating;
  final int streakCount;
  final DateTime? streakLastDate;
  final bool isActive;

  const PlayerProfile({
    required this.id,
    required this.name,
    required this.avatarId,
    required this.age,
    required this.createdAt,
    this.totalXp = 0,
    this.currentRank = 0,
    this.coinBalance = 0,
    this.puzzleRating = 600,
    this.streakCount = 0,
    this.streakLastDate,
    this.isActive = false,
  });

  PlayerProfile copyWith({
    int? totalXp,
    int? currentRank,
    int? coinBalance,
    int? puzzleRating,
    int? streakCount,
    DateTime? streakLastDate,
    bool? isActive,
  }) {
    return PlayerProfile(
      id: id,
      name: name,
      avatarId: avatarId,
      age: age,
      createdAt: createdAt,
      totalXp: totalXp ?? this.totalXp,
      currentRank: currentRank ?? this.currentRank,
      coinBalance: coinBalance ?? this.coinBalance,
      puzzleRating: puzzleRating ?? this.puzzleRating,
      streakCount: streakCount ?? this.streakCount,
      streakLastDate: streakLastDate ?? this.streakLastDate,
      isActive: isActive ?? this.isActive,
    );
  }
}
