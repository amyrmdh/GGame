import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/entity/info.dart';
import 'package:ggame/utils/color_util.dart';

class ItemAdditional extends StatelessWidget {
  final Game game;

  const ItemAdditional({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0.h,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.8,
        mainAxisSpacing: 5.0.h,
        children: _itemList(game)
            .map(
              (e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title ?? "-",
                    style: TextStyle(
                      color: ColorUtil.textSecondary(),
                      fontSize: 12.0.sp,
                    ),
                  ),
                  Text(
                    e.desc ?? "-",
                    style: TextStyle(
                      color: ColorUtil.textPrimary(),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

List<Info> _itemList(Game game) {
  return [
    Info(title: "Release Date", desc: game.toReleaseDate()),
    Info(title: "Genre", desc: game.genre),
    Info(title: "Platform", desc: game.platform),
    Info(title: "Status", desc: game.status),
    Info(title: "Developper", desc: game.developer),
    Info(title: "Publisher", desc: game.publisher),
  ];
}
