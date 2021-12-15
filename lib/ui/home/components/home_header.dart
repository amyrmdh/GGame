import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'favorite_btn.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(
          height: 3.0.h,
        ),
        Text(
          'What would you like to play?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(
          height: 24.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SearchField(),
            FavoriteBtn(),
          ],
        ),
      ],
    );
  }
}
