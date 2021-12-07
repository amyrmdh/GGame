import 'package:flutter/material.dart';
import 'package:ggame_project/entity/game.dart';

class ItemScreenshots extends StatelessWidget {
  final Game game;

  const ItemScreenshots({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listScreenshots = game.screenshots;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${game.title} Screenshots",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        listScreenshots.isNotEmpty
            ? SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listScreenshots.length,
                    itemBuilder: (context, i) {
                      var screenshots = listScreenshots[i];
                      return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: ClipPath(
                              child: Image.network(screenshots.image),
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ));
                    }),
              )
            : Container(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
