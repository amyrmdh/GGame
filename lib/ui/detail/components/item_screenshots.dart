import 'package:flutter/material.dart';
import 'package:ggame/entity/game.dart';

class ItemScreenshots extends StatelessWidget {
  final Game game;

  const ItemScreenshots({Key? key, required this.game}) : super(key: key);

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
        listScreenshots!.isNotEmpty
            ? SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listScreenshots.length,
                    itemBuilder: (context, i) {
                      var screenshots = listScreenshots[i];
                      var image = screenshots.image;
                      return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: ClipPath(
                              child: image!.isNotEmpty
                                  ? Image.network(image)
                                  : Container(),
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
