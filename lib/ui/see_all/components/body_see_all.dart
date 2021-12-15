import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/size_config.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'item_card.dart';

class BodySeeAll extends StatefulWidget {
  final List<Game> gameList;
  const BodySeeAll({Key? key, required this.gameList}) : super(key: key);

  @override
  _BodySeeAllState createState() => _BodySeeAllState();
}

class _BodySeeAllState extends State<BodySeeAll> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 10.0.h,
      crossAxisSpacing: 10.0.w,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0.w,
        vertical: 20.0.h,
      ),
      itemBuilder: (context, index) {
        Game game = widget.gameList[index];
        return ItemCard(game: game, index: index);
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      itemCount: widget.gameList.length,
    );
  }
}
