import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/data/network/api_service.dart';
import 'package:ggame/entity/game.dart';

import 'package:ggame/utils/color_util.dart';
import 'package:ggame/utils/str_util.dart';
import '../../size_config.dart';
import 'components/body_see_all.dart';

class SeeAllScreen extends StatefulWidget {
  final String platform;
  const SeeAllScreen({Key? key, required this.platform}) : super(key: key);

  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Game>> _futureGame;

  @override
  void initState() {
    _futureGame = _apiService.getListGame(widget.platform);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.platform == 'pc')
              ? widget.platform.toUpperCase()
              : StringUtil.capitalize(widget.platform),
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: ColorUtil.background(),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Game>>(
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
            List<Game> gameList = snapshot.data!;
            return BodySeeAll(gameList: gameList);
          }
        },
      ),
      backgroundColor: ColorUtil.background(),
    );
  }
}
