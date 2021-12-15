import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/entity/game.dart';
import 'package:ggame/entity/info.dart';
import 'package:ggame/entity/min_system.dart';
import 'package:ggame/utils/color_util.dart';

class ItemRequirements extends StatelessWidget {
  final Game game;

  const ItemRequirements({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Minimum System Requirements",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.0.sp,
          ),
        ),
        SizedBox(
          height: 18.0.h,
        ),
        SizedBox(
          height: 350.0.h,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 5.0.h,
            children: _itemRequire(
              game.minimumSystemRequirements ?? MinimumSystemRequirements(),
            )
                .map((e) => Column(
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
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<Info> _itemRequire(MinimumSystemRequirements sys) {
  return [
    Info(title: "OS", desc: sys.os),
    Info(title: "Processor", desc: sys.processor),
    Info(title: "Memory", desc: sys.memory),
    Info(title: "Graphics", desc: sys.graphics),
    Info(title: "Storage", desc: sys.storage),
    Info(
      title: "Additional Notes",
      desc: "Specifications may change during development",
    ),
  ];
}
