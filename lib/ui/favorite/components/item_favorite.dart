import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        width: 100.0.h,
        height: 190.0.h,
        padding: EdgeInsets.only(
          top: 8.0.h,
          bottom: 8.0.h,
          right: 16.0.w,
          left: 16.0.w,
        ),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          confirmDismiss: confirmDismiss,
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            child: InkWell(
              onTap: () => AppRoute.to(
                DetailGame(gameDetail: favorite.gameId),
              ),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                ),
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
                        height: 100.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0.r),
                          ),
                          gradient: const LinearGradient(
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
                      left: 0.0.h,
                      bottom: 0.0.h,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0.r),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          left: 15.0.w,
                          bottom: 15.0.h,
                          right: 10.0.w,
                        ),
                        child: Text(
                          favorite.title ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
