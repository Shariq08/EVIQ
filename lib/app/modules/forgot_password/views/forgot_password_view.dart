import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/modules/onboarding/views/onboarding_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/decoration.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:eviq/app/services/validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtil.kcPrimaryWhite,
        appBar: EVAppbar(title: ''),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyleUtil.cairo600(
                  fontSize: 24,
                ),
              ),
              16.kheightBox,
              Text(
                'Enter the email, phone number or username associated with your account to change your password.',
                style: TextStyleUtil.cairo400(),
              ),
              24.kheightBox,
              Text('Enter your phone, email or username',
                  style: TextStyleUtil.cairo600(
                    fontSize: 16,
                  )),
              8.kheightBox,
              Form(
                  key: controller.formKey,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) =>
                              Validators.phoneEmailOrNameValidator(value),
                          decoration: textFormInputDecoration(
                              'Enter your phone, email or username',
                              sideColor: controller.isotpSend.value
                                  ? ColorUtil.kcPrimaryColor
                                  : ColorUtil.grey200),
                        ),
                        8.kheightBox,
                        Visibility(
                          visible: controller.isotpSend.value,
                          child: Text('Link sent sucessfully',
                              style: TextStyleUtil.cairo400(
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  )),
              Spacer(),
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
                          controller.onSendOtpTap();
                        },
                        child: Obx(() => Text(
                              controller.isotpSend.value
                                  ? 'Enter OTP'
                                  : 'Send OTP',
                              style: TextStyleUtil.inter600(
                                  fontSize: 16,
                                  color: ColorUtil.kcPrimaryWhite),
                            ))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
