import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/utils/color_util.dart';
import 'package:linkwell/linkwell.dart';

class ItemVisitLink extends StatelessWidget {
  final Game game;

  const ItemVisitLink({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Visit Link",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0.sp,
          ),
        ),
        SizedBox(
          height: 18.0.h,
        ),
        LinkWell(
          "Official Website : ${game.gameUrl}.",
          style: TextStyle(
            color: ColorUtil.textSecondary(),
            fontSize: 12.0.sp,
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        LinkWell(
          "Freetogame website: ${game.freetogameProfileUrl}.",
          style: TextStyle(
            color: ColorUtil.textSecondary(),
            fontSize: 12.0.sp,
          ),
        )
      ],
    );
  }
}
