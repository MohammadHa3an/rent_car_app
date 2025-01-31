class CarModel {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final String? imagePath;

  CarModel({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    this.imagePath,
  });

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      model: map["model"],
      distance: map["distance"],
      fuelCapacity: map["fuelCapacity"],
      pricePerHour: map["pricePerHour"],
      imagePath: map["imagePath"],
    );
  }
}
