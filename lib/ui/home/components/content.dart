import 'package:flutter/material.dart';
import 'package:ggame/data/network/api_service.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/ui/detail/detail_game.dart';
import 'package:ggame/ui/home/components/game_card.dart';
import 'package:ggame/ui/home/components/section_title.dart';
import 'package:ggame/utils/app_route.dart';
import 'package:ggame/utils/str_util.dart';

import '../../../size_config.dart';

class Content extends StatefulWidget {
  final String platform;
  const Content({Key? key, required this.platform}) : super(key: key);

  @override
  _ContentPcState createState() => _ContentPcState();
}

class _ContentPcState extends State<Content> {
  final ApiService _apiService = ApiService();
  late Future<List<Game>> _futureGame;

  @override
  void initState() {
    super.initState();
    _futureGame = _apiService.getListGame(widget.platform);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
        future: _futureGame,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi Kesalahan',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: getProportionateScreenWidth(20.0),
                ),
              ),
            );
          } else {
            return Column(
              children: [
                SectionTitle(
                  text: (widget.platform == 'pc')
                      ? widget.platform.toUpperCase()
                      : StringUtil.capitalize(widget.platform),
                  press: () {
                    // To do
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(20.0)),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(20.0),
                      right: getProportionateScreenWidth(20.0),
                    ),
                    itemBuilder: (context, index) {
                      Game game = snapshot.data![index];
                      return GameCard(
                        game: game,
                        press: () => AppRoute.to(
                          DetailGame(gameDetail: game.id),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: getProportionateScreenWidth(20));
                    },
                    itemCount: 7,
                  ),
                ),
              ],
            );
          }
        });
  }
}
