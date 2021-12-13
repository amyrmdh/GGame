import 'package:flutter/material.dart';
import 'package:ggame/entity/favorite.dart';
import 'package:ggame/ui/detail/detail_game.dart';
import 'package:ggame/utils/app_route.dart';

class ItemFavorite extends StatelessWidget {
  final Favorite favorite;
  final ConfirmDismissCallback? confirmDismiss;

  const ItemFavorite(
      {Key? key, required this.favorite, required this.confirmDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String image = favorite.thumbnail ?? "";
    return Container(
        width: size.width,
        height: 190,
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          confirmDismiss: confirmDismiss,
          child: Card(
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () => AppRoute.to(DetailGame(gameDetail: favorite.gameId)),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Stack(
                  children: [
                    image.isNotEmpty
                        ? Image.network(image)
                        : Container(
                            color: Colors.black,
                          ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.98],
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          padding: const EdgeInsets.only(
                              left: 15, bottom: 15, right: 10),
                          child: Text(
                            favorite.title ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
