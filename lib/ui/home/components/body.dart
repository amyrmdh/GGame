import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/ui/home/components/content.dart';
import 'package:ggame/ui/see_all/see_all_screen.dart';
import 'package:ggame/utils/app_route.dart';
import 'content.dart';
import 'home_header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            const HomeHeader(),
            SizedBox(height: 25.0.h),
            Content(
              platform: 'pc',
              press: () {
                AppRoute.to(const SeeAllScreen(platform: 'pc'));
              },
            ),
            Content(
              platform: 'browser',
              press: () {
                AppRoute.to(const SeeAllScreen(platform: 'browser'));
              },
            ),
            Content(
              platform: 'all',
              press: () {
                AppRoute.to(const SeeAllScreen(platform: 'all'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
