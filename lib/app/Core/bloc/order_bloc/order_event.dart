part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class LoadBookings extends OrderEvent {
  final String userId;

  LoadBookings(this.userId);
}
