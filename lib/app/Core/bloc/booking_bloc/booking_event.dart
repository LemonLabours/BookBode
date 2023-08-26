part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class CheckCouponEvent extends BookingEvent {
  final String couponCode;

  CheckCouponEvent(this.couponCode);
}

class ConfirmBookingEvent extends BookingEvent {
  final Booking booking;

  ConfirmBookingEvent(this.booking);
}

class UpdateBookingDetails extends BookingEvent {
  final double basePrice;

  UpdateBookingDetails(this.basePrice);
}

class DatePicked extends BookingEvent {
  final String date;

  DatePicked(this.date);
}
