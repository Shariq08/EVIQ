import 'package:flutter/material.dart';
import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get brandColor1 =>
      dynamicColour(light: HexColor("#5D48D0"), dark: HexColor("#000000"));

  Color get brandColor2 =>
      dynamicColour(light: HexColor("#8032A8"), dark: HexColor("#000000"));
  static Color grey900 = HexColor('#131927');
  static Color green900 = HexColor('#006E1E');
  static Color green800 = HexColor('#01B763');
  static Color kcPrimaryColor = HexColor('#009F3E');
  static const Color kcPrimaryWhite = Color.fromRGBO(255, 255, 255, 1);
  static Color kcPrimaryBlack = HexColor('#212121');
  static Color grey200 = HexColor('#EEEEEE');
  static Color grey700 = HexColor('#616161');
  static Color grey500 = HexColor('#9EA2AE');
  static Color grey400 = HexColor('#F5F5F5');
  static Color grey50 = HexColor('#FAFAFA');
}
