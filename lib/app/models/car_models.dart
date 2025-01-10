class Car {
  final String brand;
  final String model;
  final String trim;
  final List<String> manufacturingRegions;

  Car({
    required this.brand,
    required this.model,
    required this.trim,
    required this.manufacturingRegions,
  });

  factory Car.fromJson(
      String brand, String model, String trim, List<String> regions) {
    return Car(
      brand: brand,
      model: model,
      trim: trim,
      manufacturingRegions: regions,
    );
  }
}

class CarData {
  final List<Car> cars;

  CarData({required this.cars});

  factory CarData.fromJson(Map<String, dynamic> json) {
    List<Car> cars = [];

    json.forEach((brand, models) {
      models.forEach((model, trims) {
        trims.forEach((trim, regions) {
          cars.add(
              Car.fromJson(brand, model, trim, List<String>.from(regions)));
        });
      });
    });

    return CarData(cars: cars);
  }
}
