import 'dart:async';
import 'package:floor/floor.dart';
import 'package:ggame/entity/favorite.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'ggame_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Favorite])
abstract class GGameDatabse extends FloorDatabase {
  GGameDao get ggameDao;
}
