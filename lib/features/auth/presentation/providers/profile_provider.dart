import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_provider.dart';
import '../../../../database/app_database.dart';

final allProfilesProvider = StreamProvider<List<Profile>>((ref) {
  return ref.watch(profileDaoProvider).watchAllProfiles();
});

final activeProfileProvider = StreamProvider<Profile?>((ref) {
  return ref.watch(profileDaoProvider).watchActiveProfile();
});

class ProfileNotifier extends AsyncNotifier<Profile?> {
  @override
  Future<Profile?> build() async {
    return ref.watch(profileDaoProvider).getActiveProfile();
  }

  Future<int> createProfile({
    required String name,
    required int avatarId,
    required int age,
  }) async {
    final dao = ref.read(profileDaoProvider);
    final id = await dao.createProfile(
      ProfilesCompanion.insert(
        name: name,
        avatarId: Value(avatarId),
        age: Value(age),
      ),
    );
    await dao.setActiveProfile(id);
    await Future.microtask(() => ref.invalidateSelf());
    return id;
  }

  Future<void> setActiveProfile(int profileId) async {
    await ref.read(profileDaoProvider).setActiveProfile(profileId);
    await Future.microtask(() => ref.invalidateSelf());
  }

  Future<void> deleteProfile(int profileId) async {
    await ref.read(profileDaoProvider).deleteProfile(profileId);
    await Future.microtask(() => ref.invalidateSelf());
  }
}

final profileNotifierProvider =
    AsyncNotifierProvider<ProfileNotifier, Profile?>(ProfileNotifier.new);
