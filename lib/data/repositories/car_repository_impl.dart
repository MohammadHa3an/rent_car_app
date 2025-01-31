import 'package:rent_car_app/data/datasources/firebase_car_data_source.dart';
import 'package:rent_car_app/data/models/car_model.dart';
import 'package:rent_car_app/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<CarModel>> fetchCars() {
    return dataSource.getCars();
  }
}
