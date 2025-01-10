import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/modules/add_vehicle/controllers/add_vehicle_controller.dart';
import 'package:eviq/app/modules/add_vehicle/views/models_view.dart';
import 'package:eviq/app/modules/add_vehicle/views/trim_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandView extends StatelessWidget {
  final AddVehicleController controller = Get.find();
  BrandView({super.key});
  // ignore: use_key_in_widget_constructors

  final searchQuery = ''.obs;
  final filteredBrands = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    final brands = controller.getBrands();
    filteredBrands.value = brands;

    void filterBrands(String query) {
      searchQuery.value = query.toLowerCase();
      if (query.isEmpty) {
        filteredBrands.value = brands;
      } else {
        filteredBrands.value = brands
            .where((brand) => brand.toLowerCase().contains(searchQuery.value))
            .toList();
      }
    }

    return Scaffold(
      appBar: EVAppbar(title: 'Select Brand'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterBrands,
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
                if (filteredBrands.isEmpty) {
                  return Center(child: Text('No brands found'));
                }
                return ListView.builder(
                  itemCount: filteredBrands.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedBrand(filteredBrands[index]);
                        Get.to(() => ModelsView(
                              brand: filteredBrands[index],
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
                                filteredBrands[index],
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
