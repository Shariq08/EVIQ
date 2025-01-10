import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:flutter/material.dart';

GestureDetector socialButton({String? imgPath}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.grey200),
          shape: BoxShape.circle,
          color: ColorUtil.kcPrimaryWhite,
        ),
        child: Image.asset(imgPath!)),
  );
}
