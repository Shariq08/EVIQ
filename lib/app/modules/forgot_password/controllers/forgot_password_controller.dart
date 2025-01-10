import 'package:eviq/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isotpSend = false.obs;
  onSendOtpTap() {
    if (formKey.currentState!.validate()) {
      isotpSend.value = true;
      // Get.toNamed(Routes.ADD_VEHICLE);
    } else {}
  }
}
