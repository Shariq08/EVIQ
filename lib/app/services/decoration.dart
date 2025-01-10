import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

InputDecoration textFormInputDecoration(String hinttext,
    {Color fillColor = ColorUtil.kcPrimaryWhite,
    Color sideColor = Colors.black}) {
  return InputDecoration(
    hintText: hinttext,
    fillColor: fillColor,
    hintStyle: TextStyleUtil.cairo400(
      fontSize: 16,
    ),
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: sideColor),
        borderRadius: const BorderRadius.all(Radius.circular(12))),
    border: OutlineInputBorder(
        borderSide: BorderSide(
          color: sideColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: sideColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}
