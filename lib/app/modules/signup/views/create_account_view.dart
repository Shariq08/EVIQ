import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:eviq/app/modules/signup/controllers/signup_controller.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/custom_button.dart';
import 'package:eviq/app/services/decoration.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:eviq/app/services/validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreateAccountView extends GetView {
  const CreateAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: ColorUtil.kcPrimaryWhite,
      appBar: EVAppbar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account 👋',
              style: TextStyleUtil.cairo600(
                fontSize: 24,
              ),
            ),
            16.kheightBox,
            Text(
              'Welcome Onboard !',
              style: TextStyleUtil.cairo400(
                fontSize: 14,
              ),
            ),
            24.kheightBox,
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter name',
                      style: TextStyleUtil.cairo600(
                        fontSize: 16,
                      )),
                  8.kheightBox,
                  TextFormField(
                    validator: (value) => Validators.nameValidator(value),
                    decoration: textFormInputDecoration('Enter name',
                        sideColor: ColorUtil.grey200),
                  ),
                  16.kheightBox,
                  Text('Enter phone or email ',
                      style: TextStyleUtil.cairo600(
                        fontSize: 16,
                      )),
                  8.kheightBox,
                  TextFormField(
                    validator: (value) =>
                        Validators.phoneOrEmailValidator(value),
                    decoration: textFormInputDecoration('Enter phone or email ',
                        sideColor: ColorUtil.grey200),
                  ),
                  28.kheightBox,
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: customRoundedButton(
                    title: 'Verify',
                    onPressed: () {
                      controller.onVerifyTap();
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
