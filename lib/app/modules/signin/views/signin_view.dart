import 'dart:io';

import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/onboarding/views/onboarding_view.dart';
import 'package:eviq/app/modules/signin/components/custom_button.dart';
import 'package:eviq/app/routes/app_pages.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/custom_button.dart';
import 'package:eviq/app/services/decoration.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:eviq/app/services/validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Sign In with',
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
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter your phone, email or username',
                        style: TextStyleUtil.cairo600(
                          fontSize: 16,
                        )),
                    8.kheightBox,
                    TextFormField(
                      validator: (value) =>
                          Validators.phoneEmailOrNameValidator(value),
                      decoration: textFormInputDecoration(
                          'Enter your phone, email or username',
                          sideColor: ColorUtil.grey200),
                    ),
                    16.kheightBox,
                    Text('Enter password',
                        style: TextStyleUtil.cairo600(
                          fontSize: 16,
                        )),
                    8.kheightBox,
                    TextFormField(
                      validator: (value) => Validators.passwordValidator(value),
                      decoration: textFormInputDecoration('Enter password',
                          sideColor: ColorUtil.grey200),
                    ),
                    28.kheightBox,
                  ],
                ),
              ),
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
                          controller.onSigninTap();
                        },
                        child: Text(
                          'Continue',
                          style: TextStyleUtil.inter600(
                              fontSize: 16, color: ColorUtil.kcPrimaryWhite),
                        )),
                  ),
                ],
              ),
              12.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.FORGOT_PASSWORD);
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyleUtil.cairo400(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              18.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyleUtil.cairo400(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                    child: Text(
                      ' Sign up',
                      style: TextStyleUtil.cairo600(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
