import 'package:flutter/material.dart';
import 'package:ggame_project/size_config.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const SectionTitle({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(23),
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              'See all',
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
