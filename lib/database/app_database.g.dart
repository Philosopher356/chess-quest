// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avatarIdMeta = const VerificationMeta(
    'avatarId',
  );
  @override
  late final GeneratedColumn<int> avatarId = GeneratedColumn<int>(
    'avatar_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _totalXpMeta = const VerificationMeta(
    'totalXp',
  );
  @override
  late final GeneratedColumn<int> totalXp = GeneratedColumn<int>(
    'total_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentRankMeta = const VerificationMeta(
    'currentRank',
  );
  @override
  late final GeneratedColumn<int> currentRank = GeneratedColumn<int>(
    'current_rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _coinBalanceMeta = const VerificationMeta(
    'coinBalance',
  );
  @override
  late final GeneratedColumn<int> coinBalance = GeneratedColumn<int>(
    'coin_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _puzzleRatingMeta = const VerificationMeta(
    'puzzleRating',
  );
  @override
  late final GeneratedColumn<int> puzzleRating = GeneratedColumn<int>(
    'puzzle_rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(600),
  );
  static const VerificationMeta _streakCountMeta = const VerificationMeta(
    'streakCount',
  );
  @override
  late final GeneratedColumn<int> streakCount = GeneratedColumn<int>(
    'streak_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _streakLastDateMeta = const VerificationMeta(
    'streakLastDate',
  );
  @override
  late final GeneratedColumn<DateTime> streakLastDate =
      GeneratedColumn<DateTime>(
        'streak_last_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    avatarId,
    age,
    createdAt,
    totalXp,
    currentRank,
    coinBalance,
    puzzleRating,
    streakCount,
    streakLastDate,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar_id')) {
      context.handle(
        _avatarIdMeta,
        avatarId.isAcceptableOrUnknown(data['avatar_id']!, _avatarIdMeta),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('total_xp')) {
      context.handle(
        _totalXpMeta,
        totalXp.isAcceptableOrUnknown(data['total_xp']!, _totalXpMeta),
      );
    }
    if (data.containsKey('current_rank')) {
      context.handle(
        _currentRankMeta,
        currentRank.isAcceptableOrUnknown(
          data['current_rank']!,
          _currentRankMeta,
        ),
      );
    }
    if (data.containsKey('coin_balance')) {
      context.handle(
        _coinBalanceMeta,
        coinBalance.isAcceptableOrUnknown(
          data['coin_balance']!,
          _coinBalanceMeta,
        ),
      );
    }
    if (data.containsKey('puzzle_rating')) {
      context.handle(
        _puzzleRatingMeta,
        puzzleRating.isAcceptableOrUnknown(
          data['puzzle_rating']!,
          _puzzleRatingMeta,
        ),
      );
    }
    if (data.containsKey('streak_count')) {
      context.handle(
        _streakCountMeta,
        streakCount.isAcceptableOrUnknown(
          data['streak_count']!,
          _streakCountMeta,
        ),
      );
    }
    if (data.containsKey('streak_last_date')) {
      context.handle(
        _streakLastDateMeta,
        streakLastDate.isAcceptableOrUnknown(
          data['streak_last_date']!,
          _streakLastDateMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      avatarId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avatar_id'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      totalXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_xp'],
      )!,
      currentRank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_rank'],
      )!,
      coinBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}coin_balance'],
      )!,
      puzzleRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}puzzle_rating'],
      )!,
      streakCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_count'],
      )!,
      streakLastDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}streak_last_date'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
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
  const Profile({
    required this.id,
    required this.name,
    required this.avatarId,
    required this.age,
    required this.createdAt,
    required this.totalXp,
    required this.currentRank,
    required this.coinBalance,
    required this.puzzleRating,
    required this.streakCount,
    this.streakLastDate,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['avatar_id'] = Variable<int>(avatarId);
    map['age'] = Variable<int>(age);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['total_xp'] = Variable<int>(totalXp);
    map['current_rank'] = Variable<int>(currentRank);
    map['coin_balance'] = Variable<int>(coinBalance);
    map['puzzle_rating'] = Variable<int>(puzzleRating);
    map['streak_count'] = Variable<int>(streakCount);
    if (!nullToAbsent || streakLastDate != null) {
      map['streak_last_date'] = Variable<DateTime>(streakLastDate);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      name: Value(name),
      avatarId: Value(avatarId),
      age: Value(age),
      createdAt: Value(createdAt),
      totalXp: Value(totalXp),
      currentRank: Value(currentRank),
      coinBalance: Value(coinBalance),
      puzzleRating: Value(puzzleRating),
      streakCount: Value(streakCount),
      streakLastDate: streakLastDate == null && nullToAbsent
          ? const Value.absent()
          : Value(streakLastDate),
      isActive: Value(isActive),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatarId: serializer.fromJson<int>(json['avatarId']),
      age: serializer.fromJson<int>(json['age']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      totalXp: serializer.fromJson<int>(json['totalXp']),
      currentRank: serializer.fromJson<int>(json['currentRank']),
      coinBalance: serializer.fromJson<int>(json['coinBalance']),
      puzzleRating: serializer.fromJson<int>(json['puzzleRating']),
      streakCount: serializer.fromJson<int>(json['streakCount']),
      streakLastDate: serializer.fromJson<DateTime?>(json['streakLastDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'avatarId': serializer.toJson<int>(avatarId),
      'age': serializer.toJson<int>(age),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'totalXp': serializer.toJson<int>(totalXp),
      'currentRank': serializer.toJson<int>(currentRank),
      'coinBalance': serializer.toJson<int>(coinBalance),
      'puzzleRating': serializer.toJson<int>(puzzleRating),
      'streakCount': serializer.toJson<int>(streakCount),
      'streakLastDate': serializer.toJson<DateTime?>(streakLastDate),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Profile copyWith({
    int? id,
    String? name,
    int? avatarId,
    int? age,
    DateTime? createdAt,
    int? totalXp,
    int? currentRank,
    int? coinBalance,
    int? puzzleRating,
    int? streakCount,
    Value<DateTime?> streakLastDate = const Value.absent(),
    bool? isActive,
  }) => Profile(
    id: id ?? this.id,
    name: name ?? this.name,
    avatarId: avatarId ?? this.avatarId,
    age: age ?? this.age,
    createdAt: createdAt ?? this.createdAt,
    totalXp: totalXp ?? this.totalXp,
    currentRank: currentRank ?? this.currentRank,
    coinBalance: coinBalance ?? this.coinBalance,
    puzzleRating: puzzleRating ?? this.puzzleRating,
    streakCount: streakCount ?? this.streakCount,
    streakLastDate: streakLastDate.present
        ? streakLastDate.value
        : this.streakLastDate,
    isActive: isActive ?? this.isActive,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      avatarId: data.avatarId.present ? data.avatarId.value : this.avatarId,
      age: data.age.present ? data.age.value : this.age,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      totalXp: data.totalXp.present ? data.totalXp.value : this.totalXp,
      currentRank: data.currentRank.present
          ? data.currentRank.value
          : this.currentRank,
      coinBalance: data.coinBalance.present
          ? data.coinBalance.value
          : this.coinBalance,
      puzzleRating: data.puzzleRating.present
          ? data.puzzleRating.value
          : this.puzzleRating,
      streakCount: data.streakCount.present
          ? data.streakCount.value
          : this.streakCount,
      streakLastDate: data.streakLastDate.present
          ? data.streakLastDate.value
          : this.streakLastDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarId: $avatarId, ')
          ..write('age: $age, ')
          ..write('createdAt: $createdAt, ')
          ..write('totalXp: $totalXp, ')
          ..write('currentRank: $currentRank, ')
          ..write('coinBalance: $coinBalance, ')
          ..write('puzzleRating: $puzzleRating, ')
          ..write('streakCount: $streakCount, ')
          ..write('streakLastDate: $streakLastDate, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    avatarId,
    age,
    createdAt,
    totalXp,
    currentRank,
    coinBalance,
    puzzleRating,
    streakCount,
    streakLastDate,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatarId == this.avatarId &&
          other.age == this.age &&
          other.createdAt == this.createdAt &&
          other.totalXp == this.totalXp &&
          other.currentRank == this.currentRank &&
          other.coinBalance == this.coinBalance &&
          other.puzzleRating == this.puzzleRating &&
          other.streakCount == this.streakCount &&
          other.streakLastDate == this.streakLastDate &&
          other.isActive == this.isActive);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> avatarId;
  final Value<int> age;
  final Value<DateTime> createdAt;
  final Value<int> totalXp;
  final Value<int> currentRank;
  final Value<int> coinBalance;
  final Value<int> puzzleRating;
  final Value<int> streakCount;
  final Value<DateTime?> streakLastDate;
  final Value<bool> isActive;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatarId = const Value.absent(),
    this.age = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.currentRank = const Value.absent(),
    this.coinBalance = const Value.absent(),
    this.puzzleRating = const Value.absent(),
    this.streakCount = const Value.absent(),
    this.streakLastDate = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.avatarId = const Value.absent(),
    this.age = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.currentRank = const Value.absent(),
    this.coinBalance = const Value.absent(),
    this.puzzleRating = const Value.absent(),
    this.streakCount = const Value.absent(),
    this.streakLastDate = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? avatarId,
    Expression<int>? age,
    Expression<DateTime>? createdAt,
    Expression<int>? totalXp,
    Expression<int>? currentRank,
    Expression<int>? coinBalance,
    Expression<int>? puzzleRating,
    Expression<int>? streakCount,
    Expression<DateTime>? streakLastDate,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatarId != null) 'avatar_id': avatarId,
      if (age != null) 'age': age,
      if (createdAt != null) 'created_at': createdAt,
      if (totalXp != null) 'total_xp': totalXp,
      if (currentRank != null) 'current_rank': currentRank,
      if (coinBalance != null) 'coin_balance': coinBalance,
      if (puzzleRating != null) 'puzzle_rating': puzzleRating,
      if (streakCount != null) 'streak_count': streakCount,
      if (streakLastDate != null) 'streak_last_date': streakLastDate,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? avatarId,
    Value<int>? age,
    Value<DateTime>? createdAt,
    Value<int>? totalXp,
    Value<int>? currentRank,
    Value<int>? coinBalance,
    Value<int>? puzzleRating,
    Value<int>? streakCount,
    Value<DateTime?>? streakLastDate,
    Value<bool>? isActive,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarId: avatarId ?? this.avatarId,
      age: age ?? this.age,
      createdAt: createdAt ?? this.createdAt,
      totalXp: totalXp ?? this.totalXp,
      currentRank: currentRank ?? this.currentRank,
      coinBalance: coinBalance ?? this.coinBalance,
      puzzleRating: puzzleRating ?? this.puzzleRating,
      streakCount: streakCount ?? this.streakCount,
      streakLastDate: streakLastDate ?? this.streakLastDate,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatarId.present) {
      map['avatar_id'] = Variable<int>(avatarId.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (totalXp.present) {
      map['total_xp'] = Variable<int>(totalXp.value);
    }
    if (currentRank.present) {
      map['current_rank'] = Variable<int>(currentRank.value);
    }
    if (coinBalance.present) {
      map['coin_balance'] = Variable<int>(coinBalance.value);
    }
    if (puzzleRating.present) {
      map['puzzle_rating'] = Variable<int>(puzzleRating.value);
    }
    if (streakCount.present) {
      map['streak_count'] = Variable<int>(streakCount.value);
    }
    if (streakLastDate.present) {
      map['streak_last_date'] = Variable<DateTime>(streakLastDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarId: $avatarId, ')
          ..write('age: $age, ')
          ..write('createdAt: $createdAt, ')
          ..write('totalXp: $totalXp, ')
          ..write('currentRank: $currentRank, ')
          ..write('coinBalance: $coinBalance, ')
          ..write('puzzleRating: $puzzleRating, ')
          ..write('streakCount: $streakCount, ')
          ..write('streakLastDate: $streakLastDate, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $ChapterProgressTable extends ChapterProgress
    with TableInfo<$ChapterProgressTable, ChapterProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChapterProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _starsEarnedMeta = const VerificationMeta(
    'starsEarned',
  );
  @override
  late final GeneratedColumn<int> starsEarned = GeneratedColumn<int>(
    'stars_earned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bestScoreMeta = const VerificationMeta(
    'bestScore',
  );
  @override
  late final GeneratedColumn<int> bestScore = GeneratedColumn<int>(
    'best_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    chapterId,
    status,
    starsEarned,
    bestScore,
    unlockedAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapter_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChapterProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('stars_earned')) {
      context.handle(
        _starsEarnedMeta,
        starsEarned.isAcceptableOrUnknown(
          data['stars_earned']!,
          _starsEarnedMeta,
        ),
      );
    }
    if (data.containsKey('best_score')) {
      context.handle(
        _bestScoreMeta,
        bestScore.isAcceptableOrUnknown(data['best_score']!, _bestScoreMeta),
      );
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {profileId, chapterId},
  ];
  @override
  ChapterProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChapterProgressData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      starsEarned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars_earned'],
      )!,
      bestScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}best_score'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $ChapterProgressTable createAlias(String alias) {
    return $ChapterProgressTable(attachedDatabase, alias);
  }
}

class ChapterProgressData extends DataClass
    implements Insertable<ChapterProgressData> {
  final int id;
  final int profileId;
  final String chapterId;
  final int status;
  final int starsEarned;
  final int bestScore;
  final DateTime? unlockedAt;
  final DateTime? completedAt;
  const ChapterProgressData({
    required this.id,
    required this.profileId,
    required this.chapterId,
    required this.status,
    required this.starsEarned,
    required this.bestScore,
    this.unlockedAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['chapter_id'] = Variable<String>(chapterId);
    map['status'] = Variable<int>(status);
    map['stars_earned'] = Variable<int>(starsEarned);
    map['best_score'] = Variable<int>(bestScore);
    if (!nullToAbsent || unlockedAt != null) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  ChapterProgressCompanion toCompanion(bool nullToAbsent) {
    return ChapterProgressCompanion(
      id: Value(id),
      profileId: Value(profileId),
      chapterId: Value(chapterId),
      status: Value(status),
      starsEarned: Value(starsEarned),
      bestScore: Value(bestScore),
      unlockedAt: unlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory ChapterProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChapterProgressData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      status: serializer.fromJson<int>(json['status']),
      starsEarned: serializer.fromJson<int>(json['starsEarned']),
      bestScore: serializer.fromJson<int>(json['bestScore']),
      unlockedAt: serializer.fromJson<DateTime?>(json['unlockedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'chapterId': serializer.toJson<String>(chapterId),
      'status': serializer.toJson<int>(status),
      'starsEarned': serializer.toJson<int>(starsEarned),
      'bestScore': serializer.toJson<int>(bestScore),
      'unlockedAt': serializer.toJson<DateTime?>(unlockedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ChapterProgressData copyWith({
    int? id,
    int? profileId,
    String? chapterId,
    int? status,
    int? starsEarned,
    int? bestScore,
    Value<DateTime?> unlockedAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ChapterProgressData(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    chapterId: chapterId ?? this.chapterId,
    status: status ?? this.status,
    starsEarned: starsEarned ?? this.starsEarned,
    bestScore: bestScore ?? this.bestScore,
    unlockedAt: unlockedAt.present ? unlockedAt.value : this.unlockedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ChapterProgressData copyWithCompanion(ChapterProgressCompanion data) {
    return ChapterProgressData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      status: data.status.present ? data.status.value : this.status,
      starsEarned: data.starsEarned.present
          ? data.starsEarned.value
          : this.starsEarned,
      bestScore: data.bestScore.present ? data.bestScore.value : this.bestScore,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChapterProgressData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('chapterId: $chapterId, ')
          ..write('status: $status, ')
          ..write('starsEarned: $starsEarned, ')
          ..write('bestScore: $bestScore, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    chapterId,
    status,
    starsEarned,
    bestScore,
    unlockedAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChapterProgressData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.chapterId == this.chapterId &&
          other.status == this.status &&
          other.starsEarned == this.starsEarned &&
          other.bestScore == this.bestScore &&
          other.unlockedAt == this.unlockedAt &&
          other.completedAt == this.completedAt);
}

class ChapterProgressCompanion extends UpdateCompanion<ChapterProgressData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> chapterId;
  final Value<int> status;
  final Value<int> starsEarned;
  final Value<int> bestScore;
  final Value<DateTime?> unlockedAt;
  final Value<DateTime?> completedAt;
  const ChapterProgressCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.status = const Value.absent(),
    this.starsEarned = const Value.absent(),
    this.bestScore = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  ChapterProgressCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String chapterId,
    this.status = const Value.absent(),
    this.starsEarned = const Value.absent(),
    this.bestScore = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
  }) : profileId = Value(profileId),
       chapterId = Value(chapterId);
  static Insertable<ChapterProgressData> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? chapterId,
    Expression<int>? status,
    Expression<int>? starsEarned,
    Expression<int>? bestScore,
    Expression<DateTime>? unlockedAt,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (chapterId != null) 'chapter_id': chapterId,
      if (status != null) 'status': status,
      if (starsEarned != null) 'stars_earned': starsEarned,
      if (bestScore != null) 'best_score': bestScore,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  ChapterProgressCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? chapterId,
    Value<int>? status,
    Value<int>? starsEarned,
    Value<int>? bestScore,
    Value<DateTime?>? unlockedAt,
    Value<DateTime?>? completedAt,
  }) {
    return ChapterProgressCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      chapterId: chapterId ?? this.chapterId,
      status: status ?? this.status,
      starsEarned: starsEarned ?? this.starsEarned,
      bestScore: bestScore ?? this.bestScore,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (starsEarned.present) {
      map['stars_earned'] = Variable<int>(starsEarned.value);
    }
    if (bestScore.present) {
      map['best_score'] = Variable<int>(bestScore.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChapterProgressCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('chapterId: $chapterId, ')
          ..write('status: $status, ')
          ..write('starsEarned: $starsEarned, ')
          ..write('bestScore: $bestScore, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $ExerciseResultsTable extends ExerciseResults
    with TableInfo<$ExerciseResultsTable, ExerciseResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bestTimeMsMeta = const VerificationMeta(
    'bestTimeMs',
  );
  @override
  late final GeneratedColumn<int> bestTimeMs = GeneratedColumn<int>(
    'best_time_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumn<int> stars = GeneratedColumn<int>(
    'stars',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    exerciseId,
    attempts,
    bestTimeMs,
    stars,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('best_time_ms')) {
      context.handle(
        _bestTimeMsMeta,
        bestTimeMs.isAcceptableOrUnknown(
          data['best_time_ms']!,
          _bestTimeMsMeta,
        ),
      );
    }
    if (data.containsKey('stars')) {
      context.handle(
        _starsMeta,
        stars.isAcceptableOrUnknown(data['stars']!, _starsMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {profileId, exerciseId},
  ];
  @override
  ExerciseResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseResult(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      bestTimeMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}best_time_ms'],
      ),
      stars: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $ExerciseResultsTable createAlias(String alias) {
    return $ExerciseResultsTable(attachedDatabase, alias);
  }
}

class ExerciseResult extends DataClass implements Insertable<ExerciseResult> {
  final int id;
  final int profileId;
  final String exerciseId;
  final int attempts;
  final int? bestTimeMs;
  final int stars;
  final DateTime? completedAt;
  const ExerciseResult({
    required this.id,
    required this.profileId,
    required this.exerciseId,
    required this.attempts,
    this.bestTimeMs,
    required this.stars,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || bestTimeMs != null) {
      map['best_time_ms'] = Variable<int>(bestTimeMs);
    }
    map['stars'] = Variable<int>(stars);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  ExerciseResultsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseResultsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      exerciseId: Value(exerciseId),
      attempts: Value(attempts),
      bestTimeMs: bestTimeMs == null && nullToAbsent
          ? const Value.absent()
          : Value(bestTimeMs),
      stars: Value(stars),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory ExerciseResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseResult(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      attempts: serializer.fromJson<int>(json['attempts']),
      bestTimeMs: serializer.fromJson<int?>(json['bestTimeMs']),
      stars: serializer.fromJson<int>(json['stars']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'attempts': serializer.toJson<int>(attempts),
      'bestTimeMs': serializer.toJson<int?>(bestTimeMs),
      'stars': serializer.toJson<int>(stars),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ExerciseResult copyWith({
    int? id,
    int? profileId,
    String? exerciseId,
    int? attempts,
    Value<int?> bestTimeMs = const Value.absent(),
    int? stars,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ExerciseResult(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    exerciseId: exerciseId ?? this.exerciseId,
    attempts: attempts ?? this.attempts,
    bestTimeMs: bestTimeMs.present ? bestTimeMs.value : this.bestTimeMs,
    stars: stars ?? this.stars,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ExerciseResult copyWithCompanion(ExerciseResultsCompanion data) {
    return ExerciseResult(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      bestTimeMs: data.bestTimeMs.present
          ? data.bestTimeMs.value
          : this.bestTimeMs,
      stars: data.stars.present ? data.stars.value : this.stars,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseResult(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('attempts: $attempts, ')
          ..write('bestTimeMs: $bestTimeMs, ')
          ..write('stars: $stars, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    exerciseId,
    attempts,
    bestTimeMs,
    stars,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseResult &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.exerciseId == this.exerciseId &&
          other.attempts == this.attempts &&
          other.bestTimeMs == this.bestTimeMs &&
          other.stars == this.stars &&
          other.completedAt == this.completedAt);
}

class ExerciseResultsCompanion extends UpdateCompanion<ExerciseResult> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> exerciseId;
  final Value<int> attempts;
  final Value<int?> bestTimeMs;
  final Value<int> stars;
  final Value<DateTime?> completedAt;
  const ExerciseResultsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.attempts = const Value.absent(),
    this.bestTimeMs = const Value.absent(),
    this.stars = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  ExerciseResultsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String exerciseId,
    this.attempts = const Value.absent(),
    this.bestTimeMs = const Value.absent(),
    this.stars = const Value.absent(),
    this.completedAt = const Value.absent(),
  }) : profileId = Value(profileId),
       exerciseId = Value(exerciseId);
  static Insertable<ExerciseResult> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? exerciseId,
    Expression<int>? attempts,
    Expression<int>? bestTimeMs,
    Expression<int>? stars,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (attempts != null) 'attempts': attempts,
      if (bestTimeMs != null) 'best_time_ms': bestTimeMs,
      if (stars != null) 'stars': stars,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  ExerciseResultsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? exerciseId,
    Value<int>? attempts,
    Value<int?>? bestTimeMs,
    Value<int>? stars,
    Value<DateTime?>? completedAt,
  }) {
    return ExerciseResultsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      exerciseId: exerciseId ?? this.exerciseId,
      attempts: attempts ?? this.attempts,
      bestTimeMs: bestTimeMs ?? this.bestTimeMs,
      stars: stars ?? this.stars,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (bestTimeMs.present) {
      map['best_time_ms'] = Variable<int>(bestTimeMs.value);
    }
    if (stars.present) {
      map['stars'] = Variable<int>(stars.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseResultsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('attempts: $attempts, ')
          ..write('bestTimeMs: $bestTimeMs, ')
          ..write('stars: $stars, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $PuzzleAttemptsTable extends PuzzleAttempts
    with TableInfo<$PuzzleAttemptsTable, PuzzleAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuzzleAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _puzzleIdMeta = const VerificationMeta(
    'puzzleId',
  );
  @override
  late final GeneratedColumn<String> puzzleId = GeneratedColumn<String>(
    'puzzle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _puzzleFenMeta = const VerificationMeta(
    'puzzleFen',
  );
  @override
  late final GeneratedColumn<String> puzzleFen = GeneratedColumn<String>(
    'puzzle_fen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _puzzleMovesMeta = const VerificationMeta(
    'puzzleMoves',
  );
  @override
  late final GeneratedColumn<String> puzzleMoves = GeneratedColumn<String>(
    'puzzle_moves',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _solvedMeta = const VerificationMeta('solved');
  @override
  late final GeneratedColumn<bool> solved = GeneratedColumn<bool>(
    'solved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("solved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _timeMsMeta = const VerificationMeta('timeMs');
  @override
  late final GeneratedColumn<int> timeMs = GeneratedColumn<int>(
    'time_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingChangeMeta = const VerificationMeta(
    'ratingChange',
  );
  @override
  late final GeneratedColumn<int> ratingChange = GeneratedColumn<int>(
    'rating_change',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _attemptedAtMeta = const VerificationMeta(
    'attemptedAt',
  );
  @override
  late final GeneratedColumn<DateTime> attemptedAt = GeneratedColumn<DateTime>(
    'attempted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    puzzleId,
    puzzleFen,
    puzzleMoves,
    solved,
    timeMs,
    ratingChange,
    attemptedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'puzzle_attempts';
  @override
  VerificationContext validateIntegrity(
    Insertable<PuzzleAttempt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('puzzle_id')) {
      context.handle(
        _puzzleIdMeta,
        puzzleId.isAcceptableOrUnknown(data['puzzle_id']!, _puzzleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_puzzleIdMeta);
    }
    if (data.containsKey('puzzle_fen')) {
      context.handle(
        _puzzleFenMeta,
        puzzleFen.isAcceptableOrUnknown(data['puzzle_fen']!, _puzzleFenMeta),
      );
    } else if (isInserting) {
      context.missing(_puzzleFenMeta);
    }
    if (data.containsKey('puzzle_moves')) {
      context.handle(
        _puzzleMovesMeta,
        puzzleMoves.isAcceptableOrUnknown(
          data['puzzle_moves']!,
          _puzzleMovesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_puzzleMovesMeta);
    }
    if (data.containsKey('solved')) {
      context.handle(
        _solvedMeta,
        solved.isAcceptableOrUnknown(data['solved']!, _solvedMeta),
      );
    }
    if (data.containsKey('time_ms')) {
      context.handle(
        _timeMsMeta,
        timeMs.isAcceptableOrUnknown(data['time_ms']!, _timeMsMeta),
      );
    }
    if (data.containsKey('rating_change')) {
      context.handle(
        _ratingChangeMeta,
        ratingChange.isAcceptableOrUnknown(
          data['rating_change']!,
          _ratingChangeMeta,
        ),
      );
    }
    if (data.containsKey('attempted_at')) {
      context.handle(
        _attemptedAtMeta,
        attemptedAt.isAcceptableOrUnknown(
          data['attempted_at']!,
          _attemptedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PuzzleAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuzzleAttempt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      puzzleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}puzzle_id'],
      )!,
      puzzleFen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}puzzle_fen'],
      )!,
      puzzleMoves: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}puzzle_moves'],
      )!,
      solved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}solved'],
      )!,
      timeMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time_ms'],
      ),
      ratingChange: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating_change'],
      )!,
      attemptedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}attempted_at'],
      )!,
    );
  }

  @override
  $PuzzleAttemptsTable createAlias(String alias) {
    return $PuzzleAttemptsTable(attachedDatabase, alias);
  }
}

class PuzzleAttempt extends DataClass implements Insertable<PuzzleAttempt> {
  final int id;
  final int profileId;
  final String puzzleId;
  final String puzzleFen;
  final String puzzleMoves;
  final bool solved;
  final int? timeMs;
  final int ratingChange;
  final DateTime attemptedAt;
  const PuzzleAttempt({
    required this.id,
    required this.profileId,
    required this.puzzleId,
    required this.puzzleFen,
    required this.puzzleMoves,
    required this.solved,
    this.timeMs,
    required this.ratingChange,
    required this.attemptedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['puzzle_id'] = Variable<String>(puzzleId);
    map['puzzle_fen'] = Variable<String>(puzzleFen);
    map['puzzle_moves'] = Variable<String>(puzzleMoves);
    map['solved'] = Variable<bool>(solved);
    if (!nullToAbsent || timeMs != null) {
      map['time_ms'] = Variable<int>(timeMs);
    }
    map['rating_change'] = Variable<int>(ratingChange);
    map['attempted_at'] = Variable<DateTime>(attemptedAt);
    return map;
  }

  PuzzleAttemptsCompanion toCompanion(bool nullToAbsent) {
    return PuzzleAttemptsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      puzzleId: Value(puzzleId),
      puzzleFen: Value(puzzleFen),
      puzzleMoves: Value(puzzleMoves),
      solved: Value(solved),
      timeMs: timeMs == null && nullToAbsent
          ? const Value.absent()
          : Value(timeMs),
      ratingChange: Value(ratingChange),
      attemptedAt: Value(attemptedAt),
    );
  }

  factory PuzzleAttempt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzleAttempt(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      puzzleId: serializer.fromJson<String>(json['puzzleId']),
      puzzleFen: serializer.fromJson<String>(json['puzzleFen']),
      puzzleMoves: serializer.fromJson<String>(json['puzzleMoves']),
      solved: serializer.fromJson<bool>(json['solved']),
      timeMs: serializer.fromJson<int?>(json['timeMs']),
      ratingChange: serializer.fromJson<int>(json['ratingChange']),
      attemptedAt: serializer.fromJson<DateTime>(json['attemptedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'puzzleId': serializer.toJson<String>(puzzleId),
      'puzzleFen': serializer.toJson<String>(puzzleFen),
      'puzzleMoves': serializer.toJson<String>(puzzleMoves),
      'solved': serializer.toJson<bool>(solved),
      'timeMs': serializer.toJson<int?>(timeMs),
      'ratingChange': serializer.toJson<int>(ratingChange),
      'attemptedAt': serializer.toJson<DateTime>(attemptedAt),
    };
  }

  PuzzleAttempt copyWith({
    int? id,
    int? profileId,
    String? puzzleId,
    String? puzzleFen,
    String? puzzleMoves,
    bool? solved,
    Value<int?> timeMs = const Value.absent(),
    int? ratingChange,
    DateTime? attemptedAt,
  }) => PuzzleAttempt(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    puzzleId: puzzleId ?? this.puzzleId,
    puzzleFen: puzzleFen ?? this.puzzleFen,
    puzzleMoves: puzzleMoves ?? this.puzzleMoves,
    solved: solved ?? this.solved,
    timeMs: timeMs.present ? timeMs.value : this.timeMs,
    ratingChange: ratingChange ?? this.ratingChange,
    attemptedAt: attemptedAt ?? this.attemptedAt,
  );
  PuzzleAttempt copyWithCompanion(PuzzleAttemptsCompanion data) {
    return PuzzleAttempt(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      puzzleId: data.puzzleId.present ? data.puzzleId.value : this.puzzleId,
      puzzleFen: data.puzzleFen.present ? data.puzzleFen.value : this.puzzleFen,
      puzzleMoves: data.puzzleMoves.present
          ? data.puzzleMoves.value
          : this.puzzleMoves,
      solved: data.solved.present ? data.solved.value : this.solved,
      timeMs: data.timeMs.present ? data.timeMs.value : this.timeMs,
      ratingChange: data.ratingChange.present
          ? data.ratingChange.value
          : this.ratingChange,
      attemptedAt: data.attemptedAt.present
          ? data.attemptedAt.value
          : this.attemptedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PuzzleAttempt(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('puzzleFen: $puzzleFen, ')
          ..write('puzzleMoves: $puzzleMoves, ')
          ..write('solved: $solved, ')
          ..write('timeMs: $timeMs, ')
          ..write('ratingChange: $ratingChange, ')
          ..write('attemptedAt: $attemptedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    puzzleId,
    puzzleFen,
    puzzleMoves,
    solved,
    timeMs,
    ratingChange,
    attemptedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzleAttempt &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.puzzleId == this.puzzleId &&
          other.puzzleFen == this.puzzleFen &&
          other.puzzleMoves == this.puzzleMoves &&
          other.solved == this.solved &&
          other.timeMs == this.timeMs &&
          other.ratingChange == this.ratingChange &&
          other.attemptedAt == this.attemptedAt);
}

class PuzzleAttemptsCompanion extends UpdateCompanion<PuzzleAttempt> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> puzzleId;
  final Value<String> puzzleFen;
  final Value<String> puzzleMoves;
  final Value<bool> solved;
  final Value<int?> timeMs;
  final Value<int> ratingChange;
  final Value<DateTime> attemptedAt;
  const PuzzleAttemptsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.puzzleFen = const Value.absent(),
    this.puzzleMoves = const Value.absent(),
    this.solved = const Value.absent(),
    this.timeMs = const Value.absent(),
    this.ratingChange = const Value.absent(),
    this.attemptedAt = const Value.absent(),
  });
  PuzzleAttemptsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String puzzleId,
    required String puzzleFen,
    required String puzzleMoves,
    this.solved = const Value.absent(),
    this.timeMs = const Value.absent(),
    this.ratingChange = const Value.absent(),
    this.attemptedAt = const Value.absent(),
  }) : profileId = Value(profileId),
       puzzleId = Value(puzzleId),
       puzzleFen = Value(puzzleFen),
       puzzleMoves = Value(puzzleMoves);
  static Insertable<PuzzleAttempt> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? puzzleId,
    Expression<String>? puzzleFen,
    Expression<String>? puzzleMoves,
    Expression<bool>? solved,
    Expression<int>? timeMs,
    Expression<int>? ratingChange,
    Expression<DateTime>? attemptedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (puzzleId != null) 'puzzle_id': puzzleId,
      if (puzzleFen != null) 'puzzle_fen': puzzleFen,
      if (puzzleMoves != null) 'puzzle_moves': puzzleMoves,
      if (solved != null) 'solved': solved,
      if (timeMs != null) 'time_ms': timeMs,
      if (ratingChange != null) 'rating_change': ratingChange,
      if (attemptedAt != null) 'attempted_at': attemptedAt,
    });
  }

  PuzzleAttemptsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? puzzleId,
    Value<String>? puzzleFen,
    Value<String>? puzzleMoves,
    Value<bool>? solved,
    Value<int?>? timeMs,
    Value<int>? ratingChange,
    Value<DateTime>? attemptedAt,
  }) {
    return PuzzleAttemptsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      puzzleId: puzzleId ?? this.puzzleId,
      puzzleFen: puzzleFen ?? this.puzzleFen,
      puzzleMoves: puzzleMoves ?? this.puzzleMoves,
      solved: solved ?? this.solved,
      timeMs: timeMs ?? this.timeMs,
      ratingChange: ratingChange ?? this.ratingChange,
      attemptedAt: attemptedAt ?? this.attemptedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (puzzleId.present) {
      map['puzzle_id'] = Variable<String>(puzzleId.value);
    }
    if (puzzleFen.present) {
      map['puzzle_fen'] = Variable<String>(puzzleFen.value);
    }
    if (puzzleMoves.present) {
      map['puzzle_moves'] = Variable<String>(puzzleMoves.value);
    }
    if (solved.present) {
      map['solved'] = Variable<bool>(solved.value);
    }
    if (timeMs.present) {
      map['time_ms'] = Variable<int>(timeMs.value);
    }
    if (ratingChange.present) {
      map['rating_change'] = Variable<int>(ratingChange.value);
    }
    if (attemptedAt.present) {
      map['attempted_at'] = Variable<DateTime>(attemptedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzleAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('puzzleFen: $puzzleFen, ')
          ..write('puzzleMoves: $puzzleMoves, ')
          ..write('solved: $solved, ')
          ..write('timeMs: $timeMs, ')
          ..write('ratingChange: $ratingChange, ')
          ..write('attemptedAt: $attemptedAt')
          ..write(')'))
        .toString();
  }
}

class $GameHistoryTable extends GameHistory
    with TableInfo<$GameHistoryTable, GameHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pgnMeta = const VerificationMeta('pgn');
  @override
  late final GeneratedColumn<String> pgn = GeneratedColumn<String>(
    'pgn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<int> result = GeneratedColumn<int>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aiDifficultyMeta = const VerificationMeta(
    'aiDifficulty',
  );
  @override
  late final GeneratedColumn<int> aiDifficulty = GeneratedColumn<int>(
    'ai_difficulty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playedAtMeta = const VerificationMeta(
    'playedAt',
  );
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
    'played_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    pgn,
    result,
    aiDifficulty,
    playedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('pgn')) {
      context.handle(
        _pgnMeta,
        pgn.isAcceptableOrUnknown(data['pgn']!, _pgnMeta),
      );
    } else if (isInserting) {
      context.missing(_pgnMeta);
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    if (data.containsKey('ai_difficulty')) {
      context.handle(
        _aiDifficultyMeta,
        aiDifficulty.isAcceptableOrUnknown(
          data['ai_difficulty']!,
          _aiDifficultyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_aiDifficultyMeta);
    }
    if (data.containsKey('played_at')) {
      context.handle(
        _playedAtMeta,
        playedAt.isAcceptableOrUnknown(data['played_at']!, _playedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      pgn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pgn'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}result'],
      )!,
      aiDifficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ai_difficulty'],
      )!,
      playedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}played_at'],
      )!,
    );
  }

  @override
  $GameHistoryTable createAlias(String alias) {
    return $GameHistoryTable(attachedDatabase, alias);
  }
}

class GameHistoryData extends DataClass implements Insertable<GameHistoryData> {
  final int id;
  final int profileId;
  final String pgn;
  final int result;
  final int aiDifficulty;
  final DateTime playedAt;
  const GameHistoryData({
    required this.id,
    required this.profileId,
    required this.pgn,
    required this.result,
    required this.aiDifficulty,
    required this.playedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['pgn'] = Variable<String>(pgn);
    map['result'] = Variable<int>(result);
    map['ai_difficulty'] = Variable<int>(aiDifficulty);
    map['played_at'] = Variable<DateTime>(playedAt);
    return map;
  }

  GameHistoryCompanion toCompanion(bool nullToAbsent) {
    return GameHistoryCompanion(
      id: Value(id),
      profileId: Value(profileId),
      pgn: Value(pgn),
      result: Value(result),
      aiDifficulty: Value(aiDifficulty),
      playedAt: Value(playedAt),
    );
  }

  factory GameHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameHistoryData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      pgn: serializer.fromJson<String>(json['pgn']),
      result: serializer.fromJson<int>(json['result']),
      aiDifficulty: serializer.fromJson<int>(json['aiDifficulty']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'pgn': serializer.toJson<String>(pgn),
      'result': serializer.toJson<int>(result),
      'aiDifficulty': serializer.toJson<int>(aiDifficulty),
      'playedAt': serializer.toJson<DateTime>(playedAt),
    };
  }

  GameHistoryData copyWith({
    int? id,
    int? profileId,
    String? pgn,
    int? result,
    int? aiDifficulty,
    DateTime? playedAt,
  }) => GameHistoryData(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    pgn: pgn ?? this.pgn,
    result: result ?? this.result,
    aiDifficulty: aiDifficulty ?? this.aiDifficulty,
    playedAt: playedAt ?? this.playedAt,
  );
  GameHistoryData copyWithCompanion(GameHistoryCompanion data) {
    return GameHistoryData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      pgn: data.pgn.present ? data.pgn.value : this.pgn,
      result: data.result.present ? data.result.value : this.result,
      aiDifficulty: data.aiDifficulty.present
          ? data.aiDifficulty.value
          : this.aiDifficulty,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameHistoryData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('pgn: $pgn, ')
          ..write('result: $result, ')
          ..write('aiDifficulty: $aiDifficulty, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, profileId, pgn, result, aiDifficulty, playedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameHistoryData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.pgn == this.pgn &&
          other.result == this.result &&
          other.aiDifficulty == this.aiDifficulty &&
          other.playedAt == this.playedAt);
}

class GameHistoryCompanion extends UpdateCompanion<GameHistoryData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> pgn;
  final Value<int> result;
  final Value<int> aiDifficulty;
  final Value<DateTime> playedAt;
  const GameHistoryCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.pgn = const Value.absent(),
    this.result = const Value.absent(),
    this.aiDifficulty = const Value.absent(),
    this.playedAt = const Value.absent(),
  });
  GameHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String pgn,
    required int result,
    required int aiDifficulty,
    this.playedAt = const Value.absent(),
  }) : profileId = Value(profileId),
       pgn = Value(pgn),
       result = Value(result),
       aiDifficulty = Value(aiDifficulty);
  static Insertable<GameHistoryData> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? pgn,
    Expression<int>? result,
    Expression<int>? aiDifficulty,
    Expression<DateTime>? playedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (pgn != null) 'pgn': pgn,
      if (result != null) 'result': result,
      if (aiDifficulty != null) 'ai_difficulty': aiDifficulty,
      if (playedAt != null) 'played_at': playedAt,
    });
  }

  GameHistoryCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? pgn,
    Value<int>? result,
    Value<int>? aiDifficulty,
    Value<DateTime>? playedAt,
  }) {
    return GameHistoryCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      pgn: pgn ?? this.pgn,
      result: result ?? this.result,
      aiDifficulty: aiDifficulty ?? this.aiDifficulty,
      playedAt: playedAt ?? this.playedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (pgn.present) {
      map['pgn'] = Variable<String>(pgn.value);
    }
    if (result.present) {
      map['result'] = Variable<int>(result.value);
    }
    if (aiDifficulty.present) {
      map['ai_difficulty'] = Variable<int>(aiDifficulty.value);
    }
    if (playedAt.present) {
      map['played_at'] = Variable<DateTime>(playedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameHistoryCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('pgn: $pgn, ')
          ..write('result: $result, ')
          ..write('aiDifficulty: $aiDifficulty, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, Achievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _achievementKeyMeta = const VerificationMeta(
    'achievementKey',
  );
  @override
  late final GeneratedColumn<String> achievementKey = GeneratedColumn<String>(
    'achievement_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    achievementKey,
    unlockedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Achievement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('achievement_key')) {
      context.handle(
        _achievementKeyMeta,
        achievementKey.isAcceptableOrUnknown(
          data['achievement_key']!,
          _achievementKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementKeyMeta);
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {profileId, achievementKey},
  ];
  @override
  Achievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achievement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      achievementKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement_key'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      )!,
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }
}

class Achievement extends DataClass implements Insertable<Achievement> {
  final int id;
  final int profileId;
  final String achievementKey;
  final DateTime unlockedAt;
  const Achievement({
    required this.id,
    required this.profileId,
    required this.achievementKey,
    required this.unlockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['achievement_key'] = Variable<String>(achievementKey);
    map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      achievementKey: Value(achievementKey),
      unlockedAt: Value(unlockedAt),
    );
  }

  factory Achievement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achievement(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      achievementKey: serializer.fromJson<String>(json['achievementKey']),
      unlockedAt: serializer.fromJson<DateTime>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'achievementKey': serializer.toJson<String>(achievementKey),
      'unlockedAt': serializer.toJson<DateTime>(unlockedAt),
    };
  }

  Achievement copyWith({
    int? id,
    int? profileId,
    String? achievementKey,
    DateTime? unlockedAt,
  }) => Achievement(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    achievementKey: achievementKey ?? this.achievementKey,
    unlockedAt: unlockedAt ?? this.unlockedAt,
  );
  Achievement copyWithCompanion(AchievementsCompanion data) {
    return Achievement(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      achievementKey: data.achievementKey.present
          ? data.achievementKey.value
          : this.achievementKey,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Achievement(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('achievementKey: $achievementKey, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, achievementKey, unlockedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.achievementKey == this.achievementKey &&
          other.unlockedAt == this.unlockedAt);
}

class AchievementsCompanion extends UpdateCompanion<Achievement> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> achievementKey;
  final Value<DateTime> unlockedAt;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.achievementKey = const Value.absent(),
    this.unlockedAt = const Value.absent(),
  });
  AchievementsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String achievementKey,
    this.unlockedAt = const Value.absent(),
  }) : profileId = Value(profileId),
       achievementKey = Value(achievementKey);
  static Insertable<Achievement> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? achievementKey,
    Expression<DateTime>? unlockedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (achievementKey != null) 'achievement_key': achievementKey,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
    });
  }

  AchievementsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? achievementKey,
    Value<DateTime>? unlockedAt,
  }) {
    return AchievementsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      achievementKey: achievementKey ?? this.achievementKey,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (achievementKey.present) {
      map['achievement_key'] = Variable<String>(achievementKey.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('achievementKey: $achievementKey, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }
}

class $InventoryTable extends Inventory
    with TableInfo<$InventoryTable, InventoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemTypeMeta = const VerificationMeta(
    'itemType',
  );
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
    'item_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemKeyMeta = const VerificationMeta(
    'itemKey',
  );
  @override
  late final GeneratedColumn<String> itemKey = GeneratedColumn<String>(
    'item_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEquippedMeta = const VerificationMeta(
    'isEquipped',
  );
  @override
  late final GeneratedColumn<bool> isEquipped = GeneratedColumn<bool>(
    'is_equipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_equipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    itemType,
    itemKey,
    isEquipped,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('item_type')) {
      context.handle(
        _itemTypeMeta,
        itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('item_key')) {
      context.handle(
        _itemKeyMeta,
        itemKey.isAcceptableOrUnknown(data['item_key']!, _itemKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_itemKeyMeta);
    }
    if (data.containsKey('is_equipped')) {
      context.handle(
        _isEquippedMeta,
        isEquipped.isAcceptableOrUnknown(data['is_equipped']!, _isEquippedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {profileId, itemType, itemKey},
  ];
  @override
  InventoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      itemType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_type'],
      )!,
      itemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_key'],
      )!,
      isEquipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_equipped'],
      )!,
    );
  }

  @override
  $InventoryTable createAlias(String alias) {
    return $InventoryTable(attachedDatabase, alias);
  }
}

class InventoryData extends DataClass implements Insertable<InventoryData> {
  final int id;
  final int profileId;
  final String itemType;
  final String itemKey;
  final bool isEquipped;
  const InventoryData({
    required this.id,
    required this.profileId,
    required this.itemType,
    required this.itemKey,
    required this.isEquipped,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['item_type'] = Variable<String>(itemType);
    map['item_key'] = Variable<String>(itemKey);
    map['is_equipped'] = Variable<bool>(isEquipped);
    return map;
  }

  InventoryCompanion toCompanion(bool nullToAbsent) {
    return InventoryCompanion(
      id: Value(id),
      profileId: Value(profileId),
      itemType: Value(itemType),
      itemKey: Value(itemKey),
      isEquipped: Value(isEquipped),
    );
  }

  factory InventoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      itemType: serializer.fromJson<String>(json['itemType']),
      itemKey: serializer.fromJson<String>(json['itemKey']),
      isEquipped: serializer.fromJson<bool>(json['isEquipped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'itemType': serializer.toJson<String>(itemType),
      'itemKey': serializer.toJson<String>(itemKey),
      'isEquipped': serializer.toJson<bool>(isEquipped),
    };
  }

  InventoryData copyWith({
    int? id,
    int? profileId,
    String? itemType,
    String? itemKey,
    bool? isEquipped,
  }) => InventoryData(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    itemType: itemType ?? this.itemType,
    itemKey: itemKey ?? this.itemKey,
    isEquipped: isEquipped ?? this.isEquipped,
  );
  InventoryData copyWithCompanion(InventoryCompanion data) {
    return InventoryData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      itemKey: data.itemKey.present ? data.itemKey.value : this.itemKey,
      isEquipped: data.isEquipped.present
          ? data.isEquipped.value
          : this.isEquipped,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('itemType: $itemType, ')
          ..write('itemKey: $itemKey, ')
          ..write('isEquipped: $isEquipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, itemType, itemKey, isEquipped);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.itemType == this.itemType &&
          other.itemKey == this.itemKey &&
          other.isEquipped == this.isEquipped);
}

class InventoryCompanion extends UpdateCompanion<InventoryData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> itemType;
  final Value<String> itemKey;
  final Value<bool> isEquipped;
  const InventoryCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.itemType = const Value.absent(),
    this.itemKey = const Value.absent(),
    this.isEquipped = const Value.absent(),
  });
  InventoryCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String itemType,
    required String itemKey,
    this.isEquipped = const Value.absent(),
  }) : profileId = Value(profileId),
       itemType = Value(itemType),
       itemKey = Value(itemKey);
  static Insertable<InventoryData> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? itemType,
    Expression<String>? itemKey,
    Expression<bool>? isEquipped,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (itemType != null) 'item_type': itemType,
      if (itemKey != null) 'item_key': itemKey,
      if (isEquipped != null) 'is_equipped': isEquipped,
    });
  }

  InventoryCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? itemType,
    Value<String>? itemKey,
    Value<bool>? isEquipped,
  }) {
    return InventoryCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      itemType: itemType ?? this.itemType,
      itemKey: itemKey ?? this.itemKey,
      isEquipped: isEquipped ?? this.isEquipped,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (itemKey.present) {
      map['item_key'] = Variable<String>(itemKey.value);
    }
    if (isEquipped.present) {
      map['is_equipped'] = Variable<bool>(isEquipped.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('itemType: $itemType, ')
          ..write('itemKey: $itemKey, ')
          ..write('isEquipped: $isEquipped')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $ChapterProgressTable chapterProgress = $ChapterProgressTable(
    this,
  );
  late final $ExerciseResultsTable exerciseResults = $ExerciseResultsTable(
    this,
  );
  late final $PuzzleAttemptsTable puzzleAttempts = $PuzzleAttemptsTable(this);
  late final $GameHistoryTable gameHistory = $GameHistoryTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $InventoryTable inventory = $InventoryTable(this);
  late final ProfileDao profileDao = ProfileDao(this as AppDatabase);
  late final ProgressDao progressDao = ProgressDao(this as AppDatabase);
  late final GamificationDao gamificationDao = GamificationDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    chapterProgress,
    exerciseResults,
    puzzleAttempts,
    gameHistory,
    achievements,
    inventory,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      required String name,
      Value<int> avatarId,
      Value<int> age,
      Value<DateTime> createdAt,
      Value<int> totalXp,
      Value<int> currentRank,
      Value<int> coinBalance,
      Value<int> puzzleRating,
      Value<int> streakCount,
      Value<DateTime?> streakLastDate,
      Value<bool> isActive,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> avatarId,
      Value<int> age,
      Value<DateTime> createdAt,
      Value<int> totalXp,
      Value<int> currentRank,
      Value<int> coinBalance,
      Value<int> puzzleRating,
      Value<int> streakCount,
      Value<DateTime?> streakLastDate,
      Value<bool> isActive,
    });

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avatarId => $composableBuilder(
    column: $table.avatarId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentRank => $composableBuilder(
    column: $table.currentRank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get coinBalance => $composableBuilder(
    column: $table.coinBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get puzzleRating => $composableBuilder(
    column: $table.puzzleRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streakCount => $composableBuilder(
    column: $table.streakCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get streakLastDate => $composableBuilder(
    column: $table.streakLastDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avatarId => $composableBuilder(
    column: $table.avatarId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentRank => $composableBuilder(
    column: $table.currentRank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get coinBalance => $composableBuilder(
    column: $table.coinBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get puzzleRating => $composableBuilder(
    column: $table.puzzleRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streakCount => $composableBuilder(
    column: $table.streakCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get streakLastDate => $composableBuilder(
    column: $table.streakLastDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get avatarId =>
      $composableBuilder(column: $table.avatarId, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get totalXp =>
      $composableBuilder(column: $table.totalXp, builder: (column) => column);

  GeneratedColumn<int> get currentRank => $composableBuilder(
    column: $table.currentRank,
    builder: (column) => column,
  );

  GeneratedColumn<int> get coinBalance => $composableBuilder(
    column: $table.coinBalance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get puzzleRating => $composableBuilder(
    column: $table.puzzleRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get streakCount => $composableBuilder(
    column: $table.streakCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get streakLastDate => $composableBuilder(
    column: $table.streakLastDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> avatarId = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> currentRank = const Value.absent(),
                Value<int> coinBalance = const Value.absent(),
                Value<int> puzzleRating = const Value.absent(),
                Value<int> streakCount = const Value.absent(),
                Value<DateTime?> streakLastDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                name: name,
                avatarId: avatarId,
                age: age,
                createdAt: createdAt,
                totalXp: totalXp,
                currentRank: currentRank,
                coinBalance: coinBalance,
                puzzleRating: puzzleRating,
                streakCount: streakCount,
                streakLastDate: streakLastDate,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int> avatarId = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> currentRank = const Value.absent(),
                Value<int> coinBalance = const Value.absent(),
                Value<int> puzzleRating = const Value.absent(),
                Value<int> streakCount = const Value.absent(),
                Value<DateTime?> streakLastDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                name: name,
                avatarId: avatarId,
                age: age,
                createdAt: createdAt,
                totalXp: totalXp,
                currentRank: currentRank,
                coinBalance: coinBalance,
                puzzleRating: puzzleRating,
                streakCount: streakCount,
                streakLastDate: streakLastDate,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $$ChapterProgressTableCreateCompanionBuilder =
    ChapterProgressCompanion Function({
      Value<int> id,
      required int profileId,
      required String chapterId,
      Value<int> status,
      Value<int> starsEarned,
      Value<int> bestScore,
      Value<DateTime?> unlockedAt,
      Value<DateTime?> completedAt,
    });
typedef $$ChapterProgressTableUpdateCompanionBuilder =
    ChapterProgressCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> chapterId,
      Value<int> status,
      Value<int> starsEarned,
      Value<int> bestScore,
      Value<DateTime?> unlockedAt,
      Value<DateTime?> completedAt,
    });

class $$ChapterProgressTableFilterComposer
    extends Composer<_$AppDatabase, $ChapterProgressTable> {
  $$ChapterProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestScore => $composableBuilder(
    column: $table.bestScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChapterProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $ChapterProgressTable> {
  $$ChapterProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestScore => $composableBuilder(
    column: $table.bestScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChapterProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChapterProgressTable> {
  $$ChapterProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get starsEarned => $composableBuilder(
    column: $table.starsEarned,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bestScore =>
      $composableBuilder(column: $table.bestScore, builder: (column) => column);

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$ChapterProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChapterProgressTable,
          ChapterProgressData,
          $$ChapterProgressTableFilterComposer,
          $$ChapterProgressTableOrderingComposer,
          $$ChapterProgressTableAnnotationComposer,
          $$ChapterProgressTableCreateCompanionBuilder,
          $$ChapterProgressTableUpdateCompanionBuilder,
          (
            ChapterProgressData,
            BaseReferences<
              _$AppDatabase,
              $ChapterProgressTable,
              ChapterProgressData
            >,
          ),
          ChapterProgressData,
          PrefetchHooks Function()
        > {
  $$ChapterProgressTableTableManager(
    _$AppDatabase db,
    $ChapterProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChapterProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChapterProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChapterProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> chapterId = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> starsEarned = const Value.absent(),
                Value<int> bestScore = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => ChapterProgressCompanion(
                id: id,
                profileId: profileId,
                chapterId: chapterId,
                status: status,
                starsEarned: starsEarned,
                bestScore: bestScore,
                unlockedAt: unlockedAt,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String chapterId,
                Value<int> status = const Value.absent(),
                Value<int> starsEarned = const Value.absent(),
                Value<int> bestScore = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => ChapterProgressCompanion.insert(
                id: id,
                profileId: profileId,
                chapterId: chapterId,
                status: status,
                starsEarned: starsEarned,
                bestScore: bestScore,
                unlockedAt: unlockedAt,
                completedAt: completedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChapterProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChapterProgressTable,
      ChapterProgressData,
      $$ChapterProgressTableFilterComposer,
      $$ChapterProgressTableOrderingComposer,
      $$ChapterProgressTableAnnotationComposer,
      $$ChapterProgressTableCreateCompanionBuilder,
      $$ChapterProgressTableUpdateCompanionBuilder,
      (
        ChapterProgressData,
        BaseReferences<
          _$AppDatabase,
          $ChapterProgressTable,
          ChapterProgressData
        >,
      ),
      ChapterProgressData,
      PrefetchHooks Function()
    >;
typedef $$ExerciseResultsTableCreateCompanionBuilder =
    ExerciseResultsCompanion Function({
      Value<int> id,
      required int profileId,
      required String exerciseId,
      Value<int> attempts,
      Value<int?> bestTimeMs,
      Value<int> stars,
      Value<DateTime?> completedAt,
    });
typedef $$ExerciseResultsTableUpdateCompanionBuilder =
    ExerciseResultsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> exerciseId,
      Value<int> attempts,
      Value<int?> bestTimeMs,
      Value<int> stars,
      Value<DateTime?> completedAt,
    });

class $$ExerciseResultsTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseResultsTable> {
  $$ExerciseResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestTimeMs => $composableBuilder(
    column: $table.bestTimeMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseResultsTable> {
  $$ExerciseResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestTimeMs => $composableBuilder(
    column: $table.bestTimeMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseResultsTable> {
  $$ExerciseResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<int> get bestTimeMs => $composableBuilder(
    column: $table.bestTimeMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$ExerciseResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseResultsTable,
          ExerciseResult,
          $$ExerciseResultsTableFilterComposer,
          $$ExerciseResultsTableOrderingComposer,
          $$ExerciseResultsTableAnnotationComposer,
          $$ExerciseResultsTableCreateCompanionBuilder,
          $$ExerciseResultsTableUpdateCompanionBuilder,
          (
            ExerciseResult,
            BaseReferences<
              _$AppDatabase,
              $ExerciseResultsTable,
              ExerciseResult
            >,
          ),
          ExerciseResult,
          PrefetchHooks Function()
        > {
  $$ExerciseResultsTableTableManager(
    _$AppDatabase db,
    $ExerciseResultsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<int?> bestTimeMs = const Value.absent(),
                Value<int> stars = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => ExerciseResultsCompanion(
                id: id,
                profileId: profileId,
                exerciseId: exerciseId,
                attempts: attempts,
                bestTimeMs: bestTimeMs,
                stars: stars,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String exerciseId,
                Value<int> attempts = const Value.absent(),
                Value<int?> bestTimeMs = const Value.absent(),
                Value<int> stars = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => ExerciseResultsCompanion.insert(
                id: id,
                profileId: profileId,
                exerciseId: exerciseId,
                attempts: attempts,
                bestTimeMs: bestTimeMs,
                stars: stars,
                completedAt: completedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseResultsTable,
      ExerciseResult,
      $$ExerciseResultsTableFilterComposer,
      $$ExerciseResultsTableOrderingComposer,
      $$ExerciseResultsTableAnnotationComposer,
      $$ExerciseResultsTableCreateCompanionBuilder,
      $$ExerciseResultsTableUpdateCompanionBuilder,
      (
        ExerciseResult,
        BaseReferences<_$AppDatabase, $ExerciseResultsTable, ExerciseResult>,
      ),
      ExerciseResult,
      PrefetchHooks Function()
    >;
typedef $$PuzzleAttemptsTableCreateCompanionBuilder =
    PuzzleAttemptsCompanion Function({
      Value<int> id,
      required int profileId,
      required String puzzleId,
      required String puzzleFen,
      required String puzzleMoves,
      Value<bool> solved,
      Value<int?> timeMs,
      Value<int> ratingChange,
      Value<DateTime> attemptedAt,
    });
typedef $$PuzzleAttemptsTableUpdateCompanionBuilder =
    PuzzleAttemptsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> puzzleId,
      Value<String> puzzleFen,
      Value<String> puzzleMoves,
      Value<bool> solved,
      Value<int?> timeMs,
      Value<int> ratingChange,
      Value<DateTime> attemptedAt,
    });

class $$PuzzleAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $PuzzleAttemptsTable> {
  $$PuzzleAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get puzzleId => $composableBuilder(
    column: $table.puzzleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get puzzleFen => $composableBuilder(
    column: $table.puzzleFen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get puzzleMoves => $composableBuilder(
    column: $table.puzzleMoves,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get solved => $composableBuilder(
    column: $table.solved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeMs => $composableBuilder(
    column: $table.timeMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ratingChange => $composableBuilder(
    column: $table.ratingChange,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get attemptedAt => $composableBuilder(
    column: $table.attemptedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PuzzleAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $PuzzleAttemptsTable> {
  $$PuzzleAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get puzzleId => $composableBuilder(
    column: $table.puzzleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get puzzleFen => $composableBuilder(
    column: $table.puzzleFen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get puzzleMoves => $composableBuilder(
    column: $table.puzzleMoves,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get solved => $composableBuilder(
    column: $table.solved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeMs => $composableBuilder(
    column: $table.timeMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ratingChange => $composableBuilder(
    column: $table.ratingChange,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get attemptedAt => $composableBuilder(
    column: $table.attemptedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PuzzleAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PuzzleAttemptsTable> {
  $$PuzzleAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get puzzleId =>
      $composableBuilder(column: $table.puzzleId, builder: (column) => column);

  GeneratedColumn<String> get puzzleFen =>
      $composableBuilder(column: $table.puzzleFen, builder: (column) => column);

  GeneratedColumn<String> get puzzleMoves => $composableBuilder(
    column: $table.puzzleMoves,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get solved =>
      $composableBuilder(column: $table.solved, builder: (column) => column);

  GeneratedColumn<int> get timeMs =>
      $composableBuilder(column: $table.timeMs, builder: (column) => column);

  GeneratedColumn<int> get ratingChange => $composableBuilder(
    column: $table.ratingChange,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get attemptedAt => $composableBuilder(
    column: $table.attemptedAt,
    builder: (column) => column,
  );
}

class $$PuzzleAttemptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PuzzleAttemptsTable,
          PuzzleAttempt,
          $$PuzzleAttemptsTableFilterComposer,
          $$PuzzleAttemptsTableOrderingComposer,
          $$PuzzleAttemptsTableAnnotationComposer,
          $$PuzzleAttemptsTableCreateCompanionBuilder,
          $$PuzzleAttemptsTableUpdateCompanionBuilder,
          (
            PuzzleAttempt,
            BaseReferences<_$AppDatabase, $PuzzleAttemptsTable, PuzzleAttempt>,
          ),
          PuzzleAttempt,
          PrefetchHooks Function()
        > {
  $$PuzzleAttemptsTableTableManager(
    _$AppDatabase db,
    $PuzzleAttemptsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PuzzleAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PuzzleAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PuzzleAttemptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> puzzleId = const Value.absent(),
                Value<String> puzzleFen = const Value.absent(),
                Value<String> puzzleMoves = const Value.absent(),
                Value<bool> solved = const Value.absent(),
                Value<int?> timeMs = const Value.absent(),
                Value<int> ratingChange = const Value.absent(),
                Value<DateTime> attemptedAt = const Value.absent(),
              }) => PuzzleAttemptsCompanion(
                id: id,
                profileId: profileId,
                puzzleId: puzzleId,
                puzzleFen: puzzleFen,
                puzzleMoves: puzzleMoves,
                solved: solved,
                timeMs: timeMs,
                ratingChange: ratingChange,
                attemptedAt: attemptedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String puzzleId,
                required String puzzleFen,
                required String puzzleMoves,
                Value<bool> solved = const Value.absent(),
                Value<int?> timeMs = const Value.absent(),
                Value<int> ratingChange = const Value.absent(),
                Value<DateTime> attemptedAt = const Value.absent(),
              }) => PuzzleAttemptsCompanion.insert(
                id: id,
                profileId: profileId,
                puzzleId: puzzleId,
                puzzleFen: puzzleFen,
                puzzleMoves: puzzleMoves,
                solved: solved,
                timeMs: timeMs,
                ratingChange: ratingChange,
                attemptedAt: attemptedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PuzzleAttemptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PuzzleAttemptsTable,
      PuzzleAttempt,
      $$PuzzleAttemptsTableFilterComposer,
      $$PuzzleAttemptsTableOrderingComposer,
      $$PuzzleAttemptsTableAnnotationComposer,
      $$PuzzleAttemptsTableCreateCompanionBuilder,
      $$PuzzleAttemptsTableUpdateCompanionBuilder,
      (
        PuzzleAttempt,
        BaseReferences<_$AppDatabase, $PuzzleAttemptsTable, PuzzleAttempt>,
      ),
      PuzzleAttempt,
      PrefetchHooks Function()
    >;
typedef $$GameHistoryTableCreateCompanionBuilder =
    GameHistoryCompanion Function({
      Value<int> id,
      required int profileId,
      required String pgn,
      required int result,
      required int aiDifficulty,
      Value<DateTime> playedAt,
    });
typedef $$GameHistoryTableUpdateCompanionBuilder =
    GameHistoryCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> pgn,
      Value<int> result,
      Value<int> aiDifficulty,
      Value<DateTime> playedAt,
    });

class $$GameHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $GameHistoryTable> {
  $$GameHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pgn => $composableBuilder(
    column: $table.pgn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get aiDifficulty => $composableBuilder(
    column: $table.aiDifficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get playedAt => $composableBuilder(
    column: $table.playedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GameHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $GameHistoryTable> {
  $$GameHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pgn => $composableBuilder(
    column: $table.pgn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get aiDifficulty => $composableBuilder(
    column: $table.aiDifficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get playedAt => $composableBuilder(
    column: $table.playedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GameHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameHistoryTable> {
  $$GameHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get pgn =>
      $composableBuilder(column: $table.pgn, builder: (column) => column);

  GeneratedColumn<int> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<int> get aiDifficulty => $composableBuilder(
    column: $table.aiDifficulty,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get playedAt =>
      $composableBuilder(column: $table.playedAt, builder: (column) => column);
}

class $$GameHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameHistoryTable,
          GameHistoryData,
          $$GameHistoryTableFilterComposer,
          $$GameHistoryTableOrderingComposer,
          $$GameHistoryTableAnnotationComposer,
          $$GameHistoryTableCreateCompanionBuilder,
          $$GameHistoryTableUpdateCompanionBuilder,
          (
            GameHistoryData,
            BaseReferences<_$AppDatabase, $GameHistoryTable, GameHistoryData>,
          ),
          GameHistoryData,
          PrefetchHooks Function()
        > {
  $$GameHistoryTableTableManager(_$AppDatabase db, $GameHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> pgn = const Value.absent(),
                Value<int> result = const Value.absent(),
                Value<int> aiDifficulty = const Value.absent(),
                Value<DateTime> playedAt = const Value.absent(),
              }) => GameHistoryCompanion(
                id: id,
                profileId: profileId,
                pgn: pgn,
                result: result,
                aiDifficulty: aiDifficulty,
                playedAt: playedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String pgn,
                required int result,
                required int aiDifficulty,
                Value<DateTime> playedAt = const Value.absent(),
              }) => GameHistoryCompanion.insert(
                id: id,
                profileId: profileId,
                pgn: pgn,
                result: result,
                aiDifficulty: aiDifficulty,
                playedAt: playedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GameHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameHistoryTable,
      GameHistoryData,
      $$GameHistoryTableFilterComposer,
      $$GameHistoryTableOrderingComposer,
      $$GameHistoryTableAnnotationComposer,
      $$GameHistoryTableCreateCompanionBuilder,
      $$GameHistoryTableUpdateCompanionBuilder,
      (
        GameHistoryData,
        BaseReferences<_$AppDatabase, $GameHistoryTable, GameHistoryData>,
      ),
      GameHistoryData,
      PrefetchHooks Function()
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      Value<int> id,
      required int profileId,
      required String achievementKey,
      Value<DateTime> unlockedAt,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> achievementKey,
      Value<DateTime> unlockedAt,
    });

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievementKey => $composableBuilder(
    column: $table.achievementKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievementKey => $composableBuilder(
    column: $table.achievementKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get achievementKey => $composableBuilder(
    column: $table.achievementKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          Achievement,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (
            Achievement,
            BaseReferences<_$AppDatabase, $AchievementsTable, Achievement>,
          ),
          Achievement,
          PrefetchHooks Function()
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> achievementKey = const Value.absent(),
                Value<DateTime> unlockedAt = const Value.absent(),
              }) => AchievementsCompanion(
                id: id,
                profileId: profileId,
                achievementKey: achievementKey,
                unlockedAt: unlockedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String achievementKey,
                Value<DateTime> unlockedAt = const Value.absent(),
              }) => AchievementsCompanion.insert(
                id: id,
                profileId: profileId,
                achievementKey: achievementKey,
                unlockedAt: unlockedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      Achievement,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (
        Achievement,
        BaseReferences<_$AppDatabase, $AchievementsTable, Achievement>,
      ),
      Achievement,
      PrefetchHooks Function()
    >;
typedef $$InventoryTableCreateCompanionBuilder =
    InventoryCompanion Function({
      Value<int> id,
      required int profileId,
      required String itemType,
      required String itemKey,
      Value<bool> isEquipped,
    });
typedef $$InventoryTableUpdateCompanionBuilder =
    InventoryCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> itemType,
      Value<String> itemKey,
      Value<bool> isEquipped,
    });

class $$InventoryTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryTable> {
  $$InventoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InventoryTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryTable> {
  $$InventoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryTable> {
  $$InventoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<String> get itemKey =>
      $composableBuilder(column: $table.itemKey, builder: (column) => column);

  GeneratedColumn<bool> get isEquipped => $composableBuilder(
    column: $table.isEquipped,
    builder: (column) => column,
  );
}

class $$InventoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryTable,
          InventoryData,
          $$InventoryTableFilterComposer,
          $$InventoryTableOrderingComposer,
          $$InventoryTableAnnotationComposer,
          $$InventoryTableCreateCompanionBuilder,
          $$InventoryTableUpdateCompanionBuilder,
          (
            InventoryData,
            BaseReferences<_$AppDatabase, $InventoryTable, InventoryData>,
          ),
          InventoryData,
          PrefetchHooks Function()
        > {
  $$InventoryTableTableManager(_$AppDatabase db, $InventoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> itemType = const Value.absent(),
                Value<String> itemKey = const Value.absent(),
                Value<bool> isEquipped = const Value.absent(),
              }) => InventoryCompanion(
                id: id,
                profileId: profileId,
                itemType: itemType,
                itemKey: itemKey,
                isEquipped: isEquipped,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String itemType,
                required String itemKey,
                Value<bool> isEquipped = const Value.absent(),
              }) => InventoryCompanion.insert(
                id: id,
                profileId: profileId,
                itemType: itemType,
                itemKey: itemKey,
                isEquipped: isEquipped,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InventoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryTable,
      InventoryData,
      $$InventoryTableFilterComposer,
      $$InventoryTableOrderingComposer,
      $$InventoryTableAnnotationComposer,
      $$InventoryTableCreateCompanionBuilder,
      $$InventoryTableUpdateCompanionBuilder,
      (
        InventoryData,
        BaseReferences<_$AppDatabase, $InventoryTable, InventoryData>,
      ),
      InventoryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$ChapterProgressTableTableManager get chapterProgress =>
      $$ChapterProgressTableTableManager(_db, _db.chapterProgress);
  $$ExerciseResultsTableTableManager get exerciseResults =>
      $$ExerciseResultsTableTableManager(_db, _db.exerciseResults);
  $$PuzzleAttemptsTableTableManager get puzzleAttempts =>
      $$PuzzleAttemptsTableTableManager(_db, _db.puzzleAttempts);
  $$GameHistoryTableTableManager get gameHistory =>
      $$GameHistoryTableTableManager(_db, _db.gameHistory);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$InventoryTableTableManager get inventory =>
      $$InventoryTableTableManager(_db, _db.inventory);
}
