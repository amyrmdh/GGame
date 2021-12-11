import 'package:flutter/material.dart';
import 'package:ggame/ui/home/components/content.dart';

import '../../../size_config.dart';
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
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(25.0)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(25.0)),
            const Content(platform: 'all'),
            const Content(platform: 'browser'),
            const Content(platform: 'pc'),
          ],
        ),
      ),
    );
  }
}
