import 'package:eviq/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController

  final currentIndex = 0.obs;
  late PageController pageController = PageController(initialPage: 0);
  final List<Map<String, String>> data = [
    {
      "title": "Easily find EV charging stations around you",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."
    },
    {
      "title": "Fast and simple to make reservation & check in",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."
    },
    {
      "title": "Make payments safely & quickly with EVPoint",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."
    },
  ];
  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void goToNextPage() {
    if (currentIndex.value < data.length - 1) {
      currentIndex.value++;
    } else {
      Get.toNamed(Routes.SIGNIN);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
