import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ggame/ui/home/home_screen.dart';
import 'package:ggame/ui/see_all/see_all_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/splash_screen.dart';
import 'utils/app_route.dart';
import 'utils/custom_scrollbar_behavior.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      builder: () => MaterialApp(
        home: const HomeScreen(),
        navigatorKey: AppRoute.navigatorKey,
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehavior(),
      ),
      designSize: const Size(360.0, 640.0),
    );
  }
}
