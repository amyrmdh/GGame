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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(115.0),
          height: getProportionateScreenHeight(165.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorUtil.backgroundSec(),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                width: getProportionateScreenWidth(115.0),
                height: getProportionateScreenHeight(110.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(76.6),
                    height: getProportionateScreenHeight(55.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenreTitile(game: game),
                      SizedBox(width: getProportionateScreenWidth(10)),
                      GenreTitile(game: game),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: const Alignment(0.0, 0.3),
                child: Text(
                  game.toReleaseDate(format: "EEEE, dd MMMM yyyy"),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenreTitile extends StatelessWidget {
  final Game game;

  const GenreTitile({
    Key? key,
    required this.game,
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
        width: getProportionateScreenWidth(30),
        height: getProportionateScreenHeight(13),
        child: Text(
          game.genre ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(5),
          ),
        ),
      ),
    );
  }
}
