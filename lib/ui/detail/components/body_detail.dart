import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/ui/detail/components/btn_favorite_detail.dart';
import 'package:ggame/utils/app_route.dart';
import 'package:ggame/utils/color_util.dart';

import 'detail_sliver_delegate.dart';
import 'item_additional.dart';
import 'item_desc.dart';
import 'item_requirements.dart';
import 'item_screenshots.dart';
import 'item_visit_link.dart';

class BodyDetail extends StatefulWidget {
  final Game game;

  const BodyDetail({Key? key, required this.game}) : super(key: key);

  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  final double expandedHeight = 300.0.h;
  final double roundedContainerHeight = 30.0.h;
  final _controller = ScrollController();
  var isGotoBottom = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels <= 300) {
        setState(() {
          isGotoBottom = false;
        });
      } else {
        setState(() {
          isGotoBottom = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Game game = widget.game;
    return Scaffold(
      backgroundColor: ColorUtil.background(),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: DetailSliverDelegate(
                  expandedHeight,
                  game,
                  roundedContainerHeight,
                ),
              ),
              SliverToBoxAdapter(
                child: _bodyDetail(game),
              )
            ],
          ),
          _toolbar(context, isGotoBottom, game),
        ],
      ),
    );
  }
}

Widget _bodyDetail(Game game) {
  return Container(
    color: ColorUtil.background(),
    child: Padding(
      padding: EdgeInsets.only(
        bottom: 16.0.h,
        left: 16.0.w,
        right: 16.0.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              game.title ?? "-",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24.0.sp,
              ),
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Text(
            game.shortDescription ?? "-",
            style: TextStyle(
              fontSize: 14.0.h,
              color: ColorUtil.textPrimary(),
            ),
          ),
          SizedBox(
            height: 18.0.h,
          ),
          ItemAdditional(
            game: game,
          ),
          SizedBox(
            height: 18.0.h,
          ),
          ItemDesc(game: game),
          ItemScreenshots(game: game),
          ItemRequirements(
            game: game,
          ),
          ItemVisitLink(game: game)
        ],
      ),
    ),
  );
}

Widget _toolbar(BuildContext context, bool isGotoBottom, Game game) {
  var title = game.title ?? "-";
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Container(
      height: kToolbarHeight,
      color: isGotoBottom ? ColorUtil.background() : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              AppRoute.back();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 16.0.r,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          isGotoBottom
              ? Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Text(
                      title.isNotEmpty ? title : "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0.sp,
                      ),
                    ),
                  ),
                )
              : Container(),
          BtnFavoriteDetail(
            game: game,
          ),
        ],
      ),
    ),
  );
}
