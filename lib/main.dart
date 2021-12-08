import 'package:flutter/material.dart';

import 'ui/splash_screen.dart';
import 'utils/app_route.dart';
import 'utils/custom_scrollbar_behavior.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRoute.navigatorKey,
      scrollBehavior: CustomScrollBehavior(),
      home: const SplashScreen(),
    );
  }
}
