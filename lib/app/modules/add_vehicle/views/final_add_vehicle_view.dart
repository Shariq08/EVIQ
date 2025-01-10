import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/add_vehicle/controllers/add_vehicle_controller.dart';
import 'package:eviq/app/routes/app_pages.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/custom_button.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FinalAddVehicleView extends GetView {
  const FinalAddVehicleView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddVehicleController());
    return Scaffold(
        appBar: EVAppbar(title: ''),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            children: [
              Center(child: Image.asset(ImageConstant.vehicle1)),
              Container(
                height: 280.kh,
                width: 372.kw,
                decoration: BoxDecoration(
                    color: ColorUtil.kcPrimaryWhite,
                    border: Border.all(color: ColorUtil.grey200),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        controller.selectedBrand.value,
                        style: TextStyleUtil.cairo600(
                          fontSize: 18,
                        ),
                      ),
                      16.kheightBox,
                      Divider(
                        color: ColorUtil.grey200,
                      ),
                      16.kheightBox,
                      Text(
                        controller.selectedModel.value,
                        style: TextStyleUtil.cairo400(
                          fontSize: 16,
                        ),
                      ),
                      16.kheightBox,
                      Divider(
                        color: ColorUtil.grey200,
                      ),
                      16.kheightBox,
                      Text(
                        controller.selectedTrim.value,
                        style: TextStyleUtil.cairo400(
                          fontSize: 16,
                        ),
                      ),
                      16.kheightBox,
                      Divider(
                        color: ColorUtil.grey200,
                      ),
                      16.kheightBox,
                      Text(
                        controller.selectedManufacturingRegion.value,
                        style: TextStyleUtil.cairo400(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                      child: customRoundedButton(
                          title: 'Add this Vehicle',
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(28.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Get.toNamed(
                                                          Routes.NAVIGATION);
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      size: 24,
                                                    )),
                                              ],
                                            ),
                                            Image.asset(
                                                ImageConstant.success2Bg),
                                            32.kheightBox,
                                            Text(
                                              'Vehicle Added Successful!',
                                              style: TextStyleUtil.cairo600(
                                                fontSize: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                          }))
                ],
              )
            ],
          ),
        ));
  }
}
