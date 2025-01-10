import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/add_vehicle/views/brand_view.dart';
import 'package:eviq/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/custom_button.dart';
import '../controllers/add_vehicle_controller.dart';

class AddVehicleView extends GetView<AddVehicleController> {
  const AddVehicleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EVAppbar(title: ''),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Personalize your experience by adding a vehicle 🚘',
                    style: TextStyleUtil.cairo600(
                      fontSize: 24,
                    ),
                  ),
                  16.kheightBox,
                  Text(
                    'Your vehicle is used to determine compatible charging stations.',
                    style: TextStyleUtil.cairo400(
                      fontSize: 14,
                    ),
                  ),
                  60.kheightBox,
                  Image.asset(ImageConstant.vehicle1)
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: customRoundedButton(
                          title: 'Add Vehicle',
                          onPressed: () {
                            Get.to(() => BrandView());
                          },
                        ),
                      ),
                    ],
                  ),
                  16.kheightBox,
                  Row(
                    children: [
                      Expanded(
                        child: customOutlinedButton(
                          title: 'Add Later',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
