import 'package:flutter/material.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState;

  static Future<T> to<T extends Object>(
    Widget route,
  ) {
    return navigator.push<T>(MaterialPageRoute(builder: (context) => route));
  }

  static Future<T> clearTopTo<T extends Object>(Widget route) {
    return navigator
        .pushReplacement(MaterialPageRoute(builder: (context) => route));
  }

  static void back<T extends Object>([
    T result,
  ]) {
    return navigator.pop(result);
  }
}