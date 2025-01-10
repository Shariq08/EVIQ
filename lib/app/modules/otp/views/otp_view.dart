import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/signup/views/create_password_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
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
              'OTP Verification 🔐',
              style: TextStyleUtil.cairo600(
                fontSize: 24,
              ),
            ),
            16.kheightBox,
            Text(
              'We have sent an OTP code to phone number ●●● ●●● ●●● ●99. Enter the OTP code below.',
              style: TextStyleUtil.cairo400(
                fontSize: 14,
              ),
            ),
            24.kheightBox,
            OtpTextField(
              fieldHeight: 60.kh, fieldWidth: 75.kw,
              filled: true,
              numberOfFields: 4, borderColor: ColorUtil.grey200,
              borderWidth: 2, enabledBorderColor: ColorUtil.grey200,
              focusedBorderColor: ColorUtil.kcPrimaryColor,
              cursorColor: ColorUtil.kcPrimaryColor,
              fillColor: ColorUtil.grey50,
              textStyle: TextStyleUtil.cairo600(
                fontSize: 24,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)),
              // decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(8)))),

              showFieldAsBox: true,

              onCodeChanged: (String code) {},

              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.off(() => CreatePasswordView());
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          size: 24,
                                        )),
                                  ],
                                ),
                                Image.asset(ImageConstant.successBg),
                                32.kheightBox,
                                Text(
                                  'Verification Successful!',
                                  style: TextStyleUtil.cairo600(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
              },
            ),
            40.kheightBox,
            Center(
              child: Text(
                "Didn't receive OTP?",
                style: TextStyleUtil.urbanist500(
                  fontSize: 18,
                ),
              ),
            ),
            16.kheightBox,
            Center(child: Obx(() {
              return controller.resendTime.value == 0
                  ? InkWell(
                      onTap: () {
                        controller.resendOtp();
                      },
                      child: Center(
                        child: Text(
                          'Resend Code',
                          style: TextStyleUtil.urbanist500(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        text: "You can resend code in ",
                        style: TextStyleUtil.urbanist500(
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: controller.resendTime.value.toString(),
                            style: TextStyleUtil.urbanist500(
                              fontSize: 18,
                              color: ColorUtil.kcPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: " s",
                            style: TextStyleUtil.urbanist500(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    );
            }))
          ],
        ),
      ),
    );
  }
}
