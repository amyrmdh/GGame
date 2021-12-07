import 'package:flutter/material.dart';
import 'package:ggame_project/data/network/api_service.dart';
import 'package:ggame_project/entity/game.dart';
import 'package:ggame_project/ui/detail/components/body_detail.dart';
import 'package:ggame_project/utils/color_util.dart';

class DetailGame extends StatefulWidget {
  final int gameDetail;

  const DetailGame({Key key, this.gameDetail}) : super(key: key);

  @override
  _DetailGameState createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  final ApiService _apiService = ApiService();
  Future<Game> _futureGameDetail;

  @override
  void initState() {
    super.initState();
    var id = widget.gameDetail == null || widget.gameDetail < 1 ? 1 : widget.gameDetail;
    _futureGameDetail = _apiService.getDetailGame(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.background(),
      body: FutureBuilder<Game>(
        future: _futureGameDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Terjadi Kesalahan",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              );
            } else {
              var game = snapshot.data;
              return BodyDetail(game: game);
            }
          }
        },
      ),
    );
  }
}
