import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/splash/views/splash_view.dart';
import 'package:eviq/app/routes/app_pages.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(ImageConstant.onboardingbg2),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => Visibility(
                    visible: controller.currentIndex.value != 2,
                    child: InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SIGNIN);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorUtil.kcPrimaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Text(
                              'Skip',
                              style: TextStyleUtil.inter600(
                                  color: ColorUtil.kcPrimaryColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                23.kwidthBox
              ],
            ),
            Image.asset(ImageConstant.onboardingbg),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Container(
                  height: 140.kh,
                  width: 409.kw,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        ColorUtil.kcPrimaryWhite.withOpacity(0),
                        ColorUtil.kcPrimaryWhite.withOpacity(0.5),
                        ColorUtil.kcPrimaryWhite.withOpacity(0.8),
                        ColorUtil.kcPrimaryWhite.withOpacity(0.9),
                        ColorUtil.kcPrimaryWhite.withOpacity(1)
                      ])),
                ),
                Container(
                  color: ColorUtil.kcPrimaryWhite,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Obx(
                        () => Column(
                          children: [
                            Text(
                              controller.data[controller.currentIndex.value]
                                  ['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyleUtil.cairo600(
                                fontSize: 24,
                              ),
                            ),
                            20.kheightBox,
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                              textAlign: TextAlign.center,
                              style: TextStyleUtil.cairo400(
                                fontSize: 16,
                              ),
                            ),
                            32.kheightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  3, (index) => buildDot(index, context)),
                            ),
                            32.kheightBox,
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          backgroundColor:
                                              ColorUtil.kcPrimaryColor),
                                      onPressed: () {
                                        controller.goToNextPage();
                                      },
                                      child: Text(
                                        'Next',
                                        style: TextStyleUtil.inter600(
                                            fontSize: 16,
                                            color: ColorUtil.kcPrimaryWhite),
                                      )),
                                )
                              ],
                            ),
                            40.kheightBox,
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ],
        )
      ]),
    ));
  }

  Widget buildDot(int index, BuildContext context) {
    return Obx(() => Container(
          height: 8.kh,
          width: controller.currentIndex.value == index ? 32 : 8,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              color: ColorUtil.kcPrimaryColor),
        ));
  }
}
