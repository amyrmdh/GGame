import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/ui/detail/detail_game.dart';
import 'package:ggame/utils/app_route.dart';
import 'package:ggame/utils/color_util.dart';

import '../../../size_config.dart';

class ItemCard extends StatelessWidget {
  final Game game;
  final int index;
  const ItemCard({
    Key? key,
    required this.game,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoute.to(DetailGame(gameDetail: game.id));
      },
      child: Card(
        color: ColorUtil.backgroundSec(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: Container(
          height: (index % 2 == 0) ? 180.0.h : 220.0.h,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0.r),
                  topRight: Radius.circular(8.0.r),
                ),
                child: Image.network(
                  game.thumbnail ?? '',
                  fit: BoxFit.cover,
                  height: (index % 2 == 0) ? 155.0.h : 192.0.h,
                ),
              ),
              SizedBox(
                height: (index % 2 == 0) ? 7.0.h : 9.0.h,
              ),
              Text(
                game.title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0.sp,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
