import 'package:flutter/material.dart';
import 'package:ggame/data/network/api_service.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/utils/color_util.dart';

import 'components/body_detail.dart';

class DetailGame extends StatefulWidget {
  final int gameDetail;

  const DetailGame({Key? key, required this.gameDetail}) : super(key: key);

  @override
  _DetailGameState createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  final ApiService _apiService = ApiService();
  late Future<Game> _futureGameDetail;

  @override
  void initState() {
    super.initState();
    var id = widget.gameDetail < 1 ? 1 : widget.gameDetail;
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
              return BodyDetail(game: game!,);
            }
          }
        },
      ),
    );
  }
}
