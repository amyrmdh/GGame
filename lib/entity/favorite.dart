import 'package:floor/floor.dart';

@Entity(tableName: 'ggame')
class Favorite {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int gameId;
  final String? title;
  final String? thumbnail;

  Favorite({this.id, required this.gameId, this.title, this.thumbnail});
}
