import 'package:flutter/material.dart';
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
        const Text(
          "Minimum System Requirements",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 350,
          child: GridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              children: _itemRequire(game.minimumSystemRequirements ?? MinimumSystemRequirements())
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title ?? "-",
                            style: TextStyle(
                                color: ColorUtil.textSecondary(), fontSize: 14),
                          ),
                          Text(
                            e.desc ?? "-",
                            style: TextStyle(
                                color: ColorUtil.textPrimary(), fontSize: 16),
                          ),
                        ],
                      ))
                  .toList()),
        )
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
        desc: "Specifications may change during development"),
  ];
}
