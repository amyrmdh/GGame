import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'favorite_btn.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, ',
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(23),
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'What would you like to play?',
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(19),
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SearchField(),
              FavoriteBtn(),
            ],
          ),
        ],
      ),
    );
  }
}
