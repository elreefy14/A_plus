import 'package:flutter/material.dart';
 const defaultColor = Color(0xFF00A9B6);
 const mainColor = Color(0xFF00A9B6);
 const primaryFontColor = Color(0xFF4a4b4d);
 const secondaryFontColor = Color(0xFF7c7d7e);
 const placeholder = Color(0xFF959696);
class MyColors {
  //save #081945 in static variable background color
  static const defaultColor = Color(0xFF00A9B6);
  //ToDo: save 0x411D2429 in static variable background color !!
  static  const mainColor = Color(0xFFfc6011);
  static  const background = Color(0xFF00A9B6);
 //static Color iconColor = Color(0xffDC8B18);
  static Color iconColor = Colors.white;
  //843BB9 in variable text color
  static Color textColor = Color(0xff843BB9);
  static const primaryFontColor = Color(0xFF4a4b4d);
  static const secondaryFontColor = Color(0xFF7c7d7e);
  static  const placeholder = Color(0xFF959696);
  static var secondary = Color(0xff262c3a);
  static var dark = Color(0xFF8D8E98);
  static var darkness = Color(0xffbdbdbd);
  static var redAccent = Color(0xffff0059);
  static const Color kPinkColor = Color(0xFFFE53BB);
  static const Color kCyanColor = Color(0xFF08F7FE);
  static const Color kGreenColor = Color(0xFF09FBD3);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kBlackColor = Color(0xFF19191B);
  static const Color kYellowColor = Color(0xFFF2A33A);
  static const Color kGreyColor = Color(0xFF767680);
  static const Color light = Color(0xFFF2F2F2);
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
