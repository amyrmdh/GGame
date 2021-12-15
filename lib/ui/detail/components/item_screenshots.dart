import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';

class ItemScreenshots extends StatelessWidget {
  final Game game;

  const ItemScreenshots({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listScreenshots = game.screenshots;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${game.title} Screenshots",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.0.sp,
          ),
        ),
        SizedBox(
          height: 18.0.sp,
        ),
        listScreenshots!.isNotEmpty
            ? SizedBox(
                height: 170.0.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listScreenshots.length,
                  itemBuilder: (context, i) {
                    var screenshots = listScreenshots[i];
                    var image = screenshots.image;
                    return Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        child: ClipPath(
                          child: image!.isNotEmpty
                              ? Image.network(image)
                              : Container(),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(),
        SizedBox(
          height: 18.0.h,
        )
      ],
    );
  }
}
