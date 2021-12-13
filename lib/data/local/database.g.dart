// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorGGameDatabse {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GGameDatabseBuilder databaseBuilder(String name) =>
      _$GGameDatabseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GGameDatabseBuilder inMemoryDatabaseBuilder() =>
      _$GGameDatabseBuilder(null);
}

class _$GGameDatabseBuilder {
  _$GGameDatabseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$GGameDatabseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$GGameDatabseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<GGameDatabse> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$GGameDatabse();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$GGameDatabse extends GGameDatabse {
  _$GGameDatabse([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GGameDao? _ggameDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ggame` (`gameId` INTEGER NOT NULL, `title` TEXT, `thumbnail` TEXT, PRIMARY KEY (`gameId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GGameDao get ggameDao {
    return _ggameDaoInstance ??= _$GGameDao(database, changeListener);
  }
}

class _$GGameDao extends GGameDao {
  _$GGameDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoriteInsertionAdapter = InsertionAdapter(
            database,
            'ggame',
            (Favorite item) => <String, Object?>{
                  'gameId': item.gameId,
                  'title': item.title,
                  'thumbnail': item.thumbnail
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Favorite> _favoriteInsertionAdapter;

  @override
  Future<List<Favorite>> getAllFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM ggame',
        mapper: (Map<String, Object?> row) => Favorite(
            gameId: row['gameId'] as int,
            title: row['title'] as String?,
            thumbnail: row['thumbnail'] as String?));
  }

  @override
  Future<Favorite?> getFavoriteById(int gameId) async {
    return _queryAdapter.query('SELECT * FROM ggame WHERE gameId = ?1',
        mapper: (Map<String, Object?> row) => Favorite(
            gameId: row['gameId'] as int,
            title: row['title'] as String?,
            thumbnail: row['thumbnail'] as String?),
        arguments: [gameId]);
  }

  @override
  Future<void> deleteFavoriteById(int gameId) async {
    await _queryAdapter.queryNoReturn('DELETE FROM ggame WHERE gameId = ?1',
        arguments: [gameId]);
  }

  @override
  Future<void> insertGame(Favorite favorite) async {
    await _favoriteInsertionAdapter.insert(favorite, OnConflictStrategy.abort);
  }
}
