import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        width: 170.0.w,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorUtil.backgroundSec(),
                borderRadius: BorderRadius.circular(15.0.r),
              ),
              width: 170.0.w,
              height: 110.0.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 127.5.w,
                  height: 68.75.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0.r),
                    child: Image.network(
                      game.thumbnail ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  game.title ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                GenreTitle(genre: game.genre),
                SizedBox(height: 8.0.h),
                Text(
                  game.toReleaseDate(format: "EEEE, dd MMMM yyyy"),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 8.0.sp,
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
      padding: EdgeInsets.only(top: 6.0.h),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorUtil.genreColor(),
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        width: 35.0.w,
        height: 12.0.h,
        child: Text(
          genre ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: 6.0.sp,
          ),
        ),
      ),
    );
  }
}
