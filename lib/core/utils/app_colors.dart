import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static final Color kPrimaryColor = HexColor("#100B20");
  static final Color yellow = HexColor("#FFDD4F");
  static final Color green = HexColor("#70ffff");
  static final Color orange = HexColor("#EF8262");
  static const Color fading = Colors.white24;
}
