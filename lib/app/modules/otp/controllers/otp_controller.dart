import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController {
  RxInt resendTime = 60.obs;
  late Timer countdownTimer;
  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime.value > 0) {
        resendTime.value -= 1;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  void resendOtp() {
    resendTime.value = 60;
    startTimer();
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
