import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ggame_project/size_config.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      backgroundColor: const Color(0xFF151515),
    );
  }
}
