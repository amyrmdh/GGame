import 'package:flutter/material.dart';
import 'package:ggame/data/local/database.dart';
import 'package:ggame/entity/favorite.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/utils/constant.dart';

class BtnFavoriteDetail extends StatefulWidget {
  final Game game;

  const BtnFavoriteDetail({Key? key, required this.game}) : super(key: key);

  @override
  _BtnFavoriteDetailState createState() => _BtnFavoriteDetailState();
}

class _BtnFavoriteDetailState extends State<BtnFavoriteDetail> {
  late GGameDatabse db;
  var isFavorited = false;

  @override
  void initState() {
    super.initState();
    $FloorGGameDatabse.databaseBuilder(ggameDb).build().then((value) {
      db = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Game game = widget.game;
    return FutureBuilder<Favorite?>(
        future: _getGameById(game.id),
        builder: (context, snapshot) {
          isFavorited = snapshot.data != null ? true : false;
          return GestureDetector(
            onTap: () => _onClickBtn(game),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 16,
                child: isFavorited
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
              ),
            ),
          );
        });
  }

  void _onClickBtn(Game game) async {
    if (!isFavorited) {
      await _addFavorite(game.toFavorite());
      setState(() {
        isFavorited = true;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Added to Favorite")));
      });
    } else {
      await _deleteFavorite(game.id);
      setState(() {
        isFavorited = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Deleted Favorite")));
      });
    }
  }

  Future<Favorite?> _getGameById(int gameId) async =>
      db.ggameDao.getFavoriteById(gameId);

  Future<void> _addFavorite(Favorite favorite) async =>
      db.ggameDao.insertGame(favorite);

  Future<void> _deleteFavorite(int gameId) async =>
      db.ggameDao.deleteFavoriteById(gameId);
}
