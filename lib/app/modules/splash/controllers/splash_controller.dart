import 'package:eviq/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 1), () => decideRouting());
  }

  decideRouting() async {
    Get.offNamed(Routes.ONBOARDING);
    // Get.offNamed(Routes.ONBOARDING);
  }
}
