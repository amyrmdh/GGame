import 'package:floor/floor.dart';
import 'package:ggame/entity/favorite.dart';

@dao
abstract class GGameDao {
  
  @Query('SELECT * FROM ggame')
  Future<List<Favorite>> getAllFavorite();

  @insert
  Future<void> insertGame(Favorite favorite);

  @Query('SELECT * FROM ggame WHERE gameId = :gameId')
  Future<Favorite?> getFavoriteById(int gameId);

  @Query('DELETE FROM ggame WHERE gameId = :gameId')
  Future<void> deleteFavoriteById(int gameId);
}