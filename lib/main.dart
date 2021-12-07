import 'package:flutter/material.dart';
import 'package:ggame_project/ui/splash_screen.dart';
import 'package:ggame_project/utils/app_route.dart';
import 'package:ggame_project/utils/custom_scrollbar_behavior.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRoute.navigatorKey,
      scrollBehavior: CustomScrollBehavior(),
      home: const SplashScreen(),
    );
  }
}
