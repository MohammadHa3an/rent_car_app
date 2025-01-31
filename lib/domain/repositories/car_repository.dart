import 'package:rent_car_app/data/models/car_model.dart';

abstract class CarRepository{
  Future<List<CarModel>> fetchCars();
}