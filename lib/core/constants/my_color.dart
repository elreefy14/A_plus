import 'package:flutter/material.dart';
 const defaultColor = Color(0xFF00A9B6);
 const mainColor = Color(0xFF00A9B6);
 const primaryFontColor = Color(0xFF4a4b4d);
 const secondaryFontColor = Color(0xFF7c7d7e);
 const placeholder = Color(0xFF959696);
class MyColors {
  //save #081945 in static variable background color
  static const defaultColor = Color(0xFF00A9B6);
  static  const mainColor = Color(0xFFfc6011);
  static const primaryFontColor = Color(0xFF4a4b4d);
  static const secondaryFontColor = Color(0xFF7c7d7e);
  static  const placeholder = Color(0xFF959696);

  static Map<int, Color> swatch = {
    50: const Color(0x1Ae6aa29), //10%
    100: const Color(0x33e6aa29), //20%
    200: const Color(0x4De6aa29), //30%
    300: const Color(0x66e6aa29), //40%
    400: const Color(0x80e6aa29), //50%
    500: const Color(0x99e6aa29), //60%
    600: const Color(0xBFe6aa29), //70%
    700: const Color(0xCCe6aa29), //80%
    800: const Color(0xE6e6aa29), //90%
    900: const Color(0xffe6aa29), //100%
  };

  static MaterialColor primaryColor = MaterialColor(0xFFFFFFFF, swatch);
}
