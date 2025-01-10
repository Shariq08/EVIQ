import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/modules/add_vehicle/controllers/add_vehicle_controller.dart';
import 'package:eviq/app/modules/add_vehicle/views/final_add_vehicle_view.dart';
import 'package:eviq/app/modules/add_vehicle/views/manufacturing_region_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrimView extends StatelessWidget {
  final String brand;
  final String model;
  final AddVehicleController controller = Get.find();

  // ignore: use_key_in_widget_constructors
  TrimView({required this.brand, required this.model});

  final searchQuery = ''.obs;
  final filteredTrims = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    final trims = controller.getTrims(brand, model);
    filteredTrims.value = trims;

    void filterTrims(String query) {
      searchQuery.value = query.toLowerCase();
      if (query.isEmpty) {
        filteredTrims.value = trims;
      } else {
        filteredTrims.value = trims
            .where((trim) => trim.toLowerCase().contains(searchQuery.value))
            .toList();
      }
    }

    return Scaffold(
      appBar: EVAppbar(title: 'Select Trim'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterTrims,
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
                if (filteredTrims.isEmpty) {
                  return Center(child: Text('No models found'));
                }
                return ListView.builder(
                  itemCount: filteredTrims.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedTrim(filteredTrims[index]);
                        Get.to(() => ManufacturingRegionView(
                              brand: brand,
                              model: model,
                              trim: filteredTrims[index],
                            ));
                      },
                      child: Card(
                        elevation: 0,
                        color: ColorUtil.kcPrimaryWhite,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                filteredTrims[index],
                                style: TextStyleUtil.cairo600(
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
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
