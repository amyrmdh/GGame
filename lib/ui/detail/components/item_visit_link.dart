import 'package:flutter/material.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/utils/color_util.dart';
import 'package:linkwell/linkwell.dart';

class ItemVisitLink extends StatelessWidget {

  final Game game;

  const ItemVisitLink({ Key? key, required this.game }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
              "Visit Link",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 20,),
            LinkWell(
              "Official Website : ${game.gameUrl}.",
              style: TextStyle(
                  color: ColorUtil.textSecondary(),
                  fontSize: 14),
            ),
            const SizedBox(height: 10,),
            LinkWell(
              "Freetogame website: ${game.freetogameProfileUrl}.",
              style: TextStyle(
                  color: ColorUtil.textSecondary(),
                  fontSize: 14),
            )
          
      ],
    );
  }
}