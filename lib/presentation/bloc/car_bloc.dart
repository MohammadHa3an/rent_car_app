import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rent_car_app/data/models/car_model.dart';
import 'package:rent_car_app/domain/usecases/get_cars.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarLoading()) {
    on<LoadCar>(
      (event, emit) async {
        emit(CarLoading());

        try {
          final cars = await getCars.call();

          emit(CarSuccess(cars: cars));
        } catch (e) {
          emit(CarError(message: e.toString()));
        }
      },
    );
  } 
}
