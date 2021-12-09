import 'package:flutter/material.dart';
import 'package:ggame/size_config.dart';
import 'package:ggame/ui/home/components/body.dart';
import 'package:ggame/utils/color_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const Body(),
      backgroundColor: ColorUtil.background(),
    );
  }
}
