import 'package:rent_car_app/data/models/car_model.dart';
import 'package:rent_car_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<CarModel>> call() async {
    return await repository.fetchCars();
  }
}
