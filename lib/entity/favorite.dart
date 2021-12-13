import 'package:floor/floor.dart';

@Entity(tableName: 'ggame')
class Favorite {
  // @PrimaryKey(autoGenerate: true)
  // final int? id;
  @PrimaryKey()
  final int gameId;
  final String? title;
  final String? thumbnail;

  Favorite({required this.gameId, this.title, this.thumbnail});

  @override
  String toString() {
    return "$gameId -> GameId $gameId";
  }
}
