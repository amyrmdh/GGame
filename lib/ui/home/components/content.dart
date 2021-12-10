import 'package:flutter/material.dart';
import 'package:ggame/data/network/api_service.dart';
import 'package:ggame/entity/game_list.dart';
import 'package:ggame/ui/home/components/game_card.dart';
import 'package:ggame/ui/home/components/section_title.dart';
import 'package:ggame/utils/str_util.dart';

import '../../../size_config.dart';

class ContentPc extends StatefulWidget {
  final String platform;
  const ContentPc({Key? key, required this.platform}) : super(key: key);

  @override
  _ContentPcState createState() => _ContentPcState();
}

class _ContentPcState extends State<ContentPc> {
  final ApiService _apiService = ApiService();
  late Future<List<GameList>> _futureGame;

  @override
  void initState() {
    super.initState();
    _futureGame = _apiService.getListGame(widget.platform);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameList>>(
        future: _futureGame,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Terjadi Kesalahan',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
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
                  press: () {},
                ),
                SizedBox(height: getProportionateScreenHeight(20.0)),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      GameList game = snapshot.data![index];
                      return GameCard(
                        game: game,
                        press: () {},
                      );
                    },
                  ),
                )
              ],
            );
          }
        });
  }
}
