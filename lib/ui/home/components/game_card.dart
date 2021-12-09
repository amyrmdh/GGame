import 'package:flutter/material.dart';
import 'package:ggame/utils/color_util.dart';

import '../../../size_config.dart';

class GameCard extends StatelessWidget {
  final String image;
  final String name;
  final GestureTapCallback press;

  const GameCard({
    Key? key,
    required this.image,
    required this.name,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
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
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(8)),
                  Text(
                    "Azure Lane",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: getProportionateScreenWidth(11),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GenreTitile(text: 'Adventurer'),
                      GenreTitile(text: 'Adventurer'),
                      GenreTitile(text: 'Adventurer'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GenreTitile(text: 'Adventurer'),
                      GenreTitile(text: 'Adventurer'),
                      GenreTitile(text: 'Adventurer'),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment(-0.65, 0.55),
                child: Text(
                  "Release: 2021-09-09",
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
  final String text;

  const GenreTitile({
    Key? key,
    required this.text,
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
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(5),
          ),
        ),
      ),
    );
  }
}
