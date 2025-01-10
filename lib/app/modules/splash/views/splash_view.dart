import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/custom_button.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(ImageConstant.locationmarker)),
        40.kheightBox,
        Text(
          'Ev Charging',
          style: TextStyleUtil.cairo600(
            fontSize: 48,
          ),
        ),
        40.kheightBox,
        Text(
          'Ev Charging',
          style: TextStyleUtil.cairo600(
            fontSize: 32,
          ),
        ),
        40.kheightBox,
        CircularProgressIndicator(
          color: ColorUtil.kcPrimaryColor,
        )
      ],
    ));
  }
}
