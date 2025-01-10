import 'package:eviq/app/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleUtil {
  static TextStyle cairo600(
      {double fontSize = 14,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.cairo(
        fontStyle: fontStyle,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        decoration: decoration);
  }

  static TextStyle cairo500(
      {double fontSize = 14,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.cairo(
        fontStyle: fontStyle,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        decoration: decoration);
  }

  static TextStyle cairo400(
      {double fontSize = 14,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.cairo(
        fontStyle: fontStyle,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        decoration: decoration);
  }

  static TextStyle inter600(
      {Color color = Colors.black,
      double fontSize = 12,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.inter(
        fontStyle: fontStyle,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        decoration: decoration);
  }

  static TextStyle urbanist500(
      {Color color = Colors.black,
      double fontSize = 12,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.urbanist(
        fontStyle: fontStyle,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        decoration: decoration);
  }

  static TextStyle urbanist700(
      {Color color = Colors.black,
      double fontSize = 12,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.urbanist(
        fontStyle: fontStyle,
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        decoration: decoration);
  }
}

extension AppText on String {
  String get string => this;

  Widget text300(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        ),
      );

  Widget text400(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      );

  Widget text500(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget text600(double fontSize,
          {Color color = Colors.black,
          TextAlign? textAlign,
          TextStyle? style}) =>
      Text(
        string,
        textAlign: textAlign,
        style: style ??
            TextStyle(
              fontFamily: 'General Sans',
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
      );
}
