import 'package:flutter/material.dart';
import 'package:ggame/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: 40.0,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search thousands of games',
          hintStyle: TextStyle(
            color: const Color(0xFF7B7C7D),
            fontSize: getProportionateScreenWidth(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 15.0,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF7B7C7D),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
