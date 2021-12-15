import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: 35.0.h,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search thousands of games',
          hintStyle: TextStyle(
            color: const Color(0xFF7B7C7D),
            fontSize: 11.0.h,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.0.h,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF7B7C7D),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
