import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/profiles_table.dart';

part 'profile_dao.g.dart';

@DriftAccessor(tables: [Profiles])
class ProfileDao extends DatabaseAccessor<AppDatabase>
    with _$ProfileDaoMixin {
  ProfileDao(super.db);

  Future<List<Profile>> getAllProfiles() => select(profiles).get();

  Stream<List<Profile>> watchAllProfiles() => select(profiles).watch();

  Future<Profile?> getActiveProfile() =>
      (select(profiles)..where((t) => t.isActive.equals(true)))
          .getSingleOrNull();

  Stream<Profile?> watchActiveProfile() =>
      (select(profiles)..where((t) => t.isActive.equals(true)))
          .watchSingleOrNull();

  Future<int> createProfile(ProfilesCompanion profile) =>
      into(profiles).insert(profile);

  Future<bool> updateProfile(ProfilesCompanion profile) =>
      update(profiles).replace(
        Profile(
          id: profile.id.value,
          name: profile.name.value,
          avatarId: profile.avatarId.value,
          age: profile.age.value,
          createdAt: profile.createdAt.value,
          totalXp: profile.totalXp.value,
          currentRank: profile.currentRank.value,
          coinBalance: profile.coinBalance.value,
          puzzleRating: profile.puzzleRating.value,
          streakCount: profile.streakCount.value,
          streakLastDate: profile.streakLastDate.value,
          isActive: profile.isActive.value,
        ),
      );

  Future<void> setActiveProfile(int profileId) async {
    await (update(profiles)..where((t) => t.isActive.equals(true)))
        .write(const ProfilesCompanion(isActive: Value(false)));
    await (update(profiles)..where((t) => t.id.equals(profileId)))
        .write(const ProfilesCompanion(isActive: Value(true)));
  }

  Future<void> addXp(int profileId, int xp, int coins) async {
    await customStatement(
      'UPDATE profiles SET total_xp = total_xp + ?, coin_balance = coin_balance + ? WHERE id = ?',
      [xp, coins, profileId],
    );
  }

  Future<void> updateRank(int profileId, int rank) async {
    await (update(profiles)..where((t) => t.id.equals(profileId)))
        .write(ProfilesCompanion(currentRank: Value(rank)));
  }

  Future<void> updateStreak(int profileId, int streakCount) async {
    await (update(profiles)..where((t) => t.id.equals(profileId))).write(
      ProfilesCompanion(
        streakCount: Value(streakCount),
        streakLastDate: Value(DateTime.now()),
      ),
    );
  }

  Future<void> updatePuzzleRating(int profileId, int newRating) async {
    await (update(profiles)..where((t) => t.id.equals(profileId)))
        .write(ProfilesCompanion(puzzleRating: Value(newRating)));
  }

  Future<int> deleteProfile(int profileId) =>
      (delete(profiles)..where((t) => t.id.equals(profileId))).go();
}
