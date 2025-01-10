import 'package:eviq/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  onSigninTap() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.ADD_VEHICLE);
    } else {}
  }
}
