import 'package:flutter/material.dart';
import 'package:ggame_project/size_config.dart';

import 'content.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30.0)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(30.0)),
            Content(
              platformName: 'Windows',
            ),
            Content(
              platformName: 'Linux',
            ),
            Content(
              platformName: 'VT',
            )
          ],
        ),
      ),
    );
  }
}
