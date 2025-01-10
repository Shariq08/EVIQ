import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/modules/signup/controllers/signup_controller.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/custom_button.dart';
import 'package:eviq/app/services/decoration.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:eviq/app/services/validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreatePasswordView extends GetView {
  const CreatePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: ColorUtil.kcPrimaryWhite,
      appBar: AppBar(
        backgroundColor: ColorUtil.kcPrimaryWhite,
        leading: IconButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorUtil.grey900,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Password 📋',
              style: TextStyleUtil.cairo600(
                fontSize: 24,
              ),
            ),
            16.kheightBox,
            Text(
              r'Password must contain at least 12 characters. Use a combo of uppercase letters, lowercase letters, numbers, and special characters (!, @, $, %, ^, &, *, +, #) ',
              style: TextStyleUtil.cairo400(
                fontSize: 14,
              ),
            ),
            24.kheightBox,
            Form(
              key: controller.passwordformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter password',
                      style: TextStyleUtil.cairo600(
                        fontSize: 16,
                      )),
                  8.kheightBox,
                  TextFormField(
                    controller: controller.passwordController,
                    validator: (value) => Validators.passwordValidator(value),
                    decoration: textFormInputDecoration('Enter password',
                        sideColor: ColorUtil.grey200),
                  ),
                  16.kheightBox,
                  Text('Re-enter Password',
                      style: TextStyleUtil.cairo600(
                        fontSize: 16,
                      )),
                  8.kheightBox,
                  TextFormField(
                    controller: controller.repasswordController,
                    validator: (value) => controller.repasswordValidator(value),
                    decoration: textFormInputDecoration('Enter re-password',
                        sideColor: ColorUtil.grey200),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: customRoundedButton(
                    title: 'Continue',
                    onPressed: () {
                      controller.onCreatePassword();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
