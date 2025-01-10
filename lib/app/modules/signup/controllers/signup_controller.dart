import 'package:eviq/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordformKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  onVerifyTap() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.OTP);
    } else {}
  }

  onCreatePassword() {
    if (passwordformKey.currentState!.validate()) {
      Get.toNamed(Routes.ADD_VEHICLE);
    } else {}
  }

  String? repasswordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Password cannot be empty';
    }
    if (passwordController.text != value) {
      return 'Password not match';
    }
    return null;
  }
}
