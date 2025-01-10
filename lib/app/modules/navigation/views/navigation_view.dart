import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: ColorUtil.kcPrimaryWhite,
        elevation: 0,
        notchMargin: 10,
        child: Container(
          height: 89.kh,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  onimgpath: ImageConstant.markerIconon,
                  imgpath: ImageConstant.markerIcon,
                  page: 0,
                  context,
                  label: "Map",
                ),
                _bottomAppBarItem(
                    onimgpath: ImageConstant.bookmarkIconon,
                    imgpath: ImageConstant.bookmarkIcon,
                    page: 1,
                    context,
                    label: "Bookmark"),
                _bottomAppBarItem(
                    onimgpath: ImageConstant.trifoldIconon,
                    imgpath: ImageConstant.trifoldIcon,
                    page: 2,
                    context,
                    label: "Booking"),
                _bottomAppBarItem(
                    onimgpath: ImageConstant.walletIconon,
                    imgpath: ImageConstant.walletIcon,
                    page: 2,
                    context,
                    label: "Wallet"),
                _bottomAppBarItem(
                    onimgpath: ImageConstant.personIconon,
                    imgpath: ImageConstant.personIcon,
                    page: 3,
                    context,
                    label: "Profile"),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        pageSnapping: false,
        physics: const BouncingScrollPhysics(),
        onPageChanged: controller.animateToTab,
        children: [...controller.pages],
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required imgpath, required onimgpath, required page, required label}) {
    return GestureDetector(
      onTap: () => controller.goToTab(page),
      child: Container(
        height: 38.kh,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.currentPage == page
                ? Image.asset(
                    onimgpath,
                  )
                : Image.asset(
                    imgpath,
                  ),
            // Icon(
            //   Icons.pin_drop_outlined,
            //   color:
            //       controller.currentPage == page ? Colors.green : Colors.grey,
            //   size: 20,
            // ),

            Text(label,
                style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: controller.currentPage == page
                      ? ColorUtil.green900
                      : ColorUtil.grey500,
                )),
          ],
        ),
      ),
    );
  }
}

class TabIcon extends StatelessWidget {
  double? h;
  double? w;
  String? path;
  TabIcon({super.key, this.h, this.w, this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: Image.asset(
        path!,
        height: h,
        width: w,
        fit: BoxFit.fill,
      ),
    );
  }
}
