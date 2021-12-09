import 'package:flutter/material.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 35.0,
      splashRadius: 1.0,
      onPressed: () {
        // Button Action
      },
      icon: const Icon(
        Icons.favorite,
        color: Colors.white,
      ),
    );
  }
}
