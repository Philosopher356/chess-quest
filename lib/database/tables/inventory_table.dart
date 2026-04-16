import 'package:drift/drift.dart';

class Inventory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  // board_theme, piece_set, mascot_outfit
  TextColumn get itemType => text()();
  TextColumn get itemKey => text()();
  BoolColumn get isEquipped => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {profileId, itemType, itemKey},
      ];
}
