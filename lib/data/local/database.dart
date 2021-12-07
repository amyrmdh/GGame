import 'dart:async';
import 'package:floor/floor.dart';
import 'package:ggame_project/data/local/ggame_dao.dart';
import 'package:ggame_project/entity/favorite.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// part 'database.g.dart';

@Database(version: 1, entities: [Favorite])
abstract class GGameDatabse extends FloorDatabase {
  GGameDao get ggameDao;
}
