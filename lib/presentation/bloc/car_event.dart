part of 'car_bloc.dart';

@immutable
sealed class CarEvent {}

class LoadCar extends CarEvent{}