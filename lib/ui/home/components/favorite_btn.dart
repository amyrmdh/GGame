import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/ui/favorite/favorite_screen.dart';
import 'package:ggame/utils/app_route.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0.w,
      splashRadius: 1.0,
      onPressed: () => AppRoute.to(const FavoriteScreen()),
      icon: const Icon(
        Icons.favorite,
        color: Colors.white,
      ),
    );
  }
}
