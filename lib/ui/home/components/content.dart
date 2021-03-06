import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/data/network/api_service.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/ui/detail/detail_game.dart';
import 'package:ggame/ui/home/components/game_card.dart';
import 'package:ggame/ui/home/components/section_title.dart';
import 'package:ggame/utils/app_route.dart';
import 'package:ggame/utils/str_util.dart';

class Content extends StatefulWidget {
  final String platform;
  final GestureTapCallback press;
  const Content({
    Key? key,
    required this.platform,
    required this.press,
  }) : super(key: key);

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
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi Kesalahan',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0.sp,
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
                  press: widget.press,
                ),
                SizedBox(height: 15.0.h),
                SizedBox(
                  height: 170.0.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
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
                      return SizedBox(width: 20.0.w);
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
