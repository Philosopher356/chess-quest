import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/app_database.dart';
import '../../database/connection/connection.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase(connect());
  ref.onDispose(() => db.close());
  return db;
});

final profileDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).profileDao;
});

final progressDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).progressDao;
});

final gamificationDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).gamificationDao;
});
