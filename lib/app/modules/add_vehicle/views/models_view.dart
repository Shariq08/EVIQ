import 'package:eviq/app/components/ev_appbar.dart';
import 'package:eviq/app/modules/add_vehicle/controllers/add_vehicle_controller.dart';
import 'package:eviq/app/modules/add_vehicle/views/trim_view.dart';
import 'package:eviq/app/services/colors.dart';
import 'package:eviq/app/services/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelsView extends StatelessWidget {
  final String brand;
  final AddVehicleController controller = Get.find();

  // ignore: use_key_in_widget_constructors
  ModelsView({required this.brand});

  final searchQuery = ''.obs;
  final filteredModels = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    final models = controller.getModels(brand);
    filteredModels.value = models;

    void filterModels(String query) {
      searchQuery.value = query.toLowerCase();
      if (query.isEmpty) {
        filteredModels.value = models;
      } else {
        filteredModels.value = models
            .where((model) => model.toLowerCase().contains(searchQuery.value))
            .toList();
      }
    }

    return Scaffold(
      appBar: EVAppbar(title: 'Select Model'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterModels,
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
                if (filteredModels.isEmpty) {
                  return Center(child: Text('No models found'));
                }
                return ListView.builder(
                  itemCount: filteredModels.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedModel(filteredModels[index]);
                        Get.to(() => TrimView(
                              brand: brand,
                              model: filteredModels[index],
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
                                filteredModels[index],
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
