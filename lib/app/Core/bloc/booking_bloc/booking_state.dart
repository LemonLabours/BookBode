part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class CouponValid extends BookingState {
  final Coupon coupon;
  CouponValid(this.coupon);
}

class CouponInvalid extends BookingState {}

class BookingSuccess extends BookingState {}

class BookingError extends BookingState {
  final String error;
  BookingError(this.error);
}

class BookingDetailsUpdated extends BookingState {}
