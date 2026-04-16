import 'package:flutter_test/flutter_test.dart';
import 'package:chess_quest/features/gamification/domain/entities/rank.dart';

void main() {
  group('Rank', () {
    test('fromXp returns pawnApprentice at 0 XP', () {
      expect(Rank.fromXp(0), equals(Rank.pawnApprentice));
    });

    test('fromXp returns pawnSoldier at 200 XP', () {
      expect(Rank.fromXp(200), equals(Rank.pawnSoldier));
    });

    test('fromXp returns knightSquire at 500 XP', () {
      expect(Rank.fromXp(500), equals(Rank.knightSquire));
    });

    test('fromXp returns grandmaster at 12000 XP', () {
      expect(Rank.fromXp(12000), equals(Rank.grandmaster));
    });

    test('fromXp returns correct rank at boundary - 1', () {
      expect(Rank.fromXp(199), equals(Rank.pawnApprentice));
      expect(Rank.fromXp(499), equals(Rank.pawnSoldier));
    });

    test('progressToNext returns 0.0 at rank min XP', () {
      expect(Rank.pawnApprentice.progressToNext(0), equals(0.0));
      expect(Rank.pawnSoldier.progressToNext(200), equals(0.0));
    });

    test('progressToNext returns 1.0 at rank max XP', () {
      final progress = Rank.pawnApprentice.progressToNext(200);
      expect(progress, equals(1.0));
    });

    test('progressToNext returns 0.5 at midpoint', () {
      // pawnApprentice: 0-200, midpoint = 100
      final progress = Rank.pawnApprentice.progressToNext(100);
      expect(progress, equals(0.5));
    });

    test('grandmaster progressToNext always returns 1.0', () {
      expect(Rank.grandmaster.progressToNext(12000), equals(1.0));
      expect(Rank.grandmaster.progressToNext(99999), equals(1.0));
    });

    test('nextRank returns correct next rank', () {
      expect(Rank.pawnApprentice.nextRank, equals(Rank.pawnSoldier));
      expect(Rank.rookDefender.nextRank, equals(Rank.queensGuard));
    });

    test('nextRank returns null for grandmaster', () {
      expect(Rank.grandmaster.nextRank, isNull);
    });

    test('all ranks have increasing XP requirements', () {
      for (var i = 1; i < Rank.values.length; i++) {
        expect(
          Rank.values[i].minXp,
          greaterThan(Rank.values[i - 1].minXp),
        );
      }
    });
  });
}
