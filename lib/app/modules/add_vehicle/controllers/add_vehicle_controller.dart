import 'dart:convert';

import 'package:eviq/app/services/storage.dart';
import 'package:get/get.dart';

import '../../../models/car_models.dart';

class AddVehicleController extends GetxController {
  var car = {
    "Toyota": {
      "Corolla": {
        "L": ["China", "America"],
        "LE": ["China", "America"],
        "XLE": ["China", "America"]
      },
      "Camry": {
        "SE": ["China", "America"],
        "XSE": ["China", "America"],
        "TRD": ["China", "America"]
      },
      "RAV4": {
        "LE": ["China", "America"],
        "XLE": ["China", "America"],
        "Limited": ["China", "America"]
      }
    },
    "Honda": {
      "Civic": {
        "LX": ["China", "America"],
        "Sport": ["China", "America"],
        "EX": ["China", "America"]
      },
      "Accord": {
        "EX-L": ["China", "America"],
        "Touring": ["China", "America"],
        "Sport": ["China", "America"]
      },
      "CR-V": {
        "LX": ["China", "America"],
        "EX-L": ["China", "America"],
        "Touring": ["China", "America"]
      }
    },
    "Ford": {
      "Focus": {
        "S": ["China", "America"],
        "SE": ["China", "America"],
        "Titanium": ["China", "America"]
      },
      "Fusion": {
        "S": ["China", "America"],
        "SE": ["China", "America"],
        "Titanium": ["China", "America"]
      },
      "Escape": {
        "S": ["China", "America"],
        "SE": ["China", "America"],
        "Titanium": ["China", "America"]
      }
    }
  };

  var carData = <Car>[].obs;
  var selectedBrand = ''.obs;
  var selectedModel = ''.obs;
  var selectedTrim = ''.obs;
  var selectedManufacturingRegion = ''.obs;
  var filteredCarData = <Car>[].obs;
  var searchQuery = ''.obs;

  Future<void> loadCarData() async {
    carData.value = CarData.fromJson(car).cars;
    filteredCarData.value = carData.value;
    print(filteredCarData.value);
  }

  void filterCars(String query) {
    searchQuery.value = query.toLowerCase();
    if (searchQuery.value.isEmpty) {
      filteredCarData.value = carData;
    } else {
      filteredCarData.value = carData
          .where((car) => car.brand.toLowerCase().contains(searchQuery.value))
          .toList();
    }
  }

  List<String> getBrands() {
    return car.keys.toList();
  }

  List<String> getModels(String brand) {
    return car[brand]?.keys.toList() ?? [];
  }

  List<String> getTrims(String brand, String model) {
    return car[brand]?[model]?.keys.toList() ?? [];
  }

  List<String> getRegions(String brand, String model, String trim) {
    return car[brand]?[model]?[trim] ?? [];
  }

  void selectBrand(String brand) {
    selectedBrand.value = brand;
    selectedModel.value = '';
    selectedTrim.value = '';
    selectedManufacturingRegion.value = '';
  }

  void selectModel(String model) {
    selectedModel.value = model;
    selectedTrim.value = '';
    selectedManufacturingRegion.value = '';
  }

  void selectTrim(String trim) {
    selectedTrim.value = trim;
    selectedManufacturingRegion.value = '';
  }

  void selectManufacturingRegion(String region) {
    selectedManufacturingRegion.value = region;
  }

  @override
  void onInit() {
    loadCarData();
    super.onInit();
  }
}
