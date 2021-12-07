import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ggame_project/ui/detail/detail_game.dart';
import 'package:ggame_project/ui/home/home_screen.dart';
import 'package:ggame_project/utils/app_route.dart';
import 'package:ggame_project/utils/color_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      AppRoute.clearTopTo(const HomeScreen());
      // AppRoute.clearTopTo(const DetailGame(
      //   gameDetail: 23,
      // ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: ColorUtil.background(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "GGame",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "0.0.1",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
