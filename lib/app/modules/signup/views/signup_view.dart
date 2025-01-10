import 'dart:io';

import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/signin/components/custom_button.dart';
import 'package:eviq/app/modules/signup/views/create_account_view.dart';
import 'package:eviq/app/routes/app_pages.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(ImageConstant.chargingStation1)),
                  28.kheightBox,
                  Center(
                    child: Text(
                      'Join Us today with',
                      style: TextStyleUtil.cairo600(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  28.kheightBox,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton(imgPath: ImageConstant.googleLogo),
                        10.kwidthBox,
                        socialButton(imgPath: ImageConstant.fbLogo),
                        10.kwidthBox,
                        if (Platform.isIOS)
                          socialButton(imgPath: ImageConstant.appleLogo)
                      ],
                    ),
                  ),
                  28.kheightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: ColorUtil.grey200,
                      )),
                      Text('   or   ',
                          style: TextStyleUtil.urbanist500(
                              fontSize: 18, color: ColorUtil.grey700)),
                      Expanded(
                          child: Divider(
                        color: ColorUtil.grey200,
                      ))
                    ],
                  ),
                  28.kheightBox,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                backgroundColor: ColorUtil.kcPrimaryColor),
                            onPressed: () {
                              Get.to(() => CreateAccountView());
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyleUtil.inter600(
                                  fontSize: 16,
                                  color: ColorUtil.kcPrimaryWhite),
                            )),
                      ),
                    ],
                  ),
                  28.kheightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyleUtil.cairo400(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNIN);
                        },
                        child: Text(
                          ' Sign in',
                          style: TextStyleUtil.cairo600(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  28.kheightBox,
                  Text(
                    'By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use.',
                    style: TextStyleUtil.cairo500(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
