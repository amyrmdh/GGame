import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/utils/color_util.dart';

class ItemDesc extends StatefulWidget {
  final Game game;

  const ItemDesc({Key? key, required this.game}) : super(key: key);

  @override
  _ItemDescState createState() => _ItemDescState();
}

class _ItemDescState extends State<ItemDesc> {
  var isReadMore = true;

  @override
  Widget build(BuildContext context) {
    Game game = widget.game;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About ${game.title}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0.sp,
          ),
        ),
        SizedBox(
          height: 18.0.h,
        ),
        Text(
          game.description ?? "-",
          overflow: isReadMore ? TextOverflow.ellipsis : TextOverflow.visible,
          maxLines: isReadMore ? 5 : null,
          style: TextStyle(
            fontSize: 14.0.sp,
            color: ColorUtil.textPrimary(),
          ),
        ),
        GestureDetector(
          onTap: () => _onReadMore(),
          child: Text(
            isReadMore ? "Show More" : "Show Less",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14.0.sp,
            ),
          ),
        ),
        SizedBox(
          height: 18.0.sp,
        )
      ],
    );
  }

  void _onReadMore() {
    setState(() {
      isReadMore = !isReadMore;
    });
  }
}
