import 'package:flutter/material.dart';
import 'package:ggame/ui/home/components/section_title.dart';

import '../../../size_config.dart';
import 'game_card.dart';

class Content extends StatelessWidget {
  final String platformName;

  const Content({
    Key? key,
    required this.platformName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: platformName,
          press: () {},
        ),
        SizedBox(height: getProportionateScreenHeight(20.0)),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GameCard(
                image:
                    'https://lh3.googleusercontent.com/c6t2SbBvzX7fziAV-Xa3ZFG4MPECY5Vjv25wHyMcWJqhErLl9_Y1TSkWUWHeRCqgoQutsQW2BAr4CrSqZy1jAXHF=w640-h400-e365-rj-sc0x00ffffff',
                name: 'Azure Lane Re-Creator List Blabkasu',
                press: () {},
              ),
              GameCard(
                image:
                    'https://lh3.googleusercontent.com/c6t2SbBvzX7fziAV-Xa3ZFG4MPECY5Vjv25wHyMcWJqhErLl9_Y1TSkWUWHeRCqgoQutsQW2BAr4CrSqZy1jAXHF=w640-h400-e365-rj-sc0x00ffffff',
                name: 'Azure Lane',
                press: () {},
              ),
              GameCard(
                image:
                    'https://lh3.googleusercontent.com/c6t2SbBvzX7fziAV-Xa3ZFG4MPECY5Vjv25wHyMcWJqhErLl9_Y1TSkWUWHeRCqgoQutsQW2BAr4CrSqZy1jAXHF=w640-h400-e365-rj-sc0x00ffffff',
                name: 'Azure Lane',
                press: () {},
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
