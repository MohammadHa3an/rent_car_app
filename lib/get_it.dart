import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rent_car_app/data/datasources/firebase_car_data_source.dart';
import 'package:rent_car_app/data/repositories/car_repository_impl.dart';
import 'package:rent_car_app/domain/usecases/get_cars.dart';
import 'package:rent_car_app/presentation/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(fireStore: getIt<FirebaseFirestore>()));

    getIt.registerLazySingleton<CarRepositoryImpl>(
        () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));

    getIt.registerLazySingleton<GetCars>(
        () => GetCars(getIt<CarRepositoryImpl>()));

    getIt.registerFactory<CarBloc>(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw Exception(e);
  }
}
