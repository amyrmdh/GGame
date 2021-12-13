import 'package:flutter/material.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/utils/color_util.dart';

import '../../../size_config.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final GestureTapCallback press;

  const GameCard({
    Key? key,
    required this.game,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(170.0),
        height: getProportionateScreenHeight(0.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorUtil.backgroundSec(),
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: getProportionateScreenWidth(170.0),
              height: getProportionateScreenHeight(110.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(127.5),
                  height: getProportionateScreenHeight(68.75),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      game.thumbnail ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Text(
                  game.title ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(11),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                GenreTitle(genre: game.genre),
                SizedBox(height: getProportionateScreenHeight(8)),
                Text(
                  game.toReleaseDate(format: "EEEE, dd MMMM yyyy"),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenreTitle extends StatelessWidget {
  final String? genre;

  const GenreTitle({
    Key? key,
    this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorUtil.genreColor(),
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: getProportionateScreenWidth(35),
        height: getProportionateScreenHeight(13),
        child: Text(
          genre ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(6),
          ),
        ),
      ),
    );
  }
}
