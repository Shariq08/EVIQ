import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/constants/image_constant.dart';
import 'package:eviq/app/modules/add_vehicle/controllers/add_vehicle_controller.dart';
import 'package:eviq/app/modules/add_vehicle/views/final_add_vehicle_view.dart';
import 'package:eviq/app/modules/add_vehicle/views/models_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/responsive_size.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManufacturingRegionView extends StatelessWidget {
  final String brand;
  final String model;
  final String trim;
  final AddVehicleController controller = Get.find();

  // ignore: use_key_in_widget_constructors
  ManufacturingRegionView(
      {required this.brand, required this.model, required this.trim});

  final searchQuery = ''.obs;
  final filteredregions = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    final regions = controller.getRegions(brand, model, trim);
    filteredregions.value = regions;

    void filterRegions(String query) {
      searchQuery.value = query.toLowerCase();
      if (query.isEmpty) {
        filteredregions.value = regions;
      } else {
        filteredregions.value = regions
            .where((region) => region.toLowerCase().contains(searchQuery.value))
            .toList();
      }
    }

    return Scaffold(
      appBar: EVAppbar(title: 'Select Manufacturing Region'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterRegions,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorUtil.grey500,
                ),
                hintText: 'Search',
                fillColor: ColorUtil.grey400,
                hintStyle: TextStyleUtil.cairo400(
                  fontSize: 16,
                ),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorUtil.kcPrimaryWhite),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorUtil.kcPrimaryWhite,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorUtil.kcPrimaryWhite,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (filteredregions.isEmpty) {
                  return Center(child: Text('No models found'));
                }
                return ListView.builder(
                  itemCount: filteredregions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedManufacturingRegion(
                            filteredregions[index] == 'America'
                                ? 'American Built'
                                : 'China Built');
                        Get.to(() => FinalAddVehicleView());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorUtil.grey200),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          elevation: 0,
                          color: ColorUtil.kcPrimaryWhite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24),
                            child: Row(
                              children: [
                                Image.asset(
                                  filteredregions[index] == 'America'
                                      ? ImageConstant.americaFlag
                                      : ImageConstant.chinaFlag,
                                  height: 60.kh,
                                  width: 40.kw,
                                ),
                                20.kwidthBox,
                                Container(
                                    height: 40.kh,
                                    child: VerticalDivider(
                                        thickness: 2,
                                        color: ColorUtil.grey200)),
                                20.kwidthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredregions[index] == 'America'
                                          ? 'American Built'
                                          : 'China Built',
                                      style: TextStyleUtil.urbanist700(
                                        fontSize: 20,
                                      ),
                                    ),
                                    6.kheightBox,
                                    Text(
                                      filteredregions[index],
                                      style: TextStyleUtil.urbanist500(
                                          fontSize: 14,
                                          color: ColorUtil.grey700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
