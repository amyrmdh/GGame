import 'package:flutter/material.dart';

class ColorUtil {
  static const String _background = "#151515";
  static const String _backgroundSec = "#2D2D2D";
  static const String _genreColor = "#C4C4C4";

  static background() {
    return _getColorFromHex(_background);
  }

  static backgroundSec() {
    return _getColorFromHex(_backgroundSec);
  }

  static genreColor() {
    return _getColorFromHex(_genreColor);
  }

  static textPrimary() {
    return Colors.white;
  }

  static textSecondary() {
    return Colors.grey;
  }

  static Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}
