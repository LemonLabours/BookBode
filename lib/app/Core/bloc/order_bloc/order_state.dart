part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Booking> bookings;

  OrderLoaded(this.bookings);
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}

