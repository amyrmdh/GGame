import 'package:floor/floor.dart';
import 'package:ggame/entity/favorite.dart';

@dao
abstract class GGameDao {
  
  @Query('SELECT * FROM ggame')
  Future<List<Favorite>> getAllFavorite();

  @insert
  Future<void> insertQrcode(Favorite favorite);

  @Query('SELECT EXISTS(SELECT * FROM ggame WHERE gameId = :gameId)')
  Future<bool?> isGameFavorite(int gameId);

  @Query('DELETE FROM ggame WHERE id = :id')
  Future<void> deleteFavoriteById(int id);
}