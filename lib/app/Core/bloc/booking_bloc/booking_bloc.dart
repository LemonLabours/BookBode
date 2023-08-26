import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import '../../../Models/booking_model.dart';
import '../../../Models/coupon_model.dart';
import '../../services/Database/database.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final DatabaseService _dbService = DatabaseService();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController guestsController = TextEditingController();
  final TextEditingController roomsController = TextEditingController();
  final TextEditingController couponController = TextEditingController();

  double totalPrice = 0;
  double basePrice = 0;

  BookingBloc() : super(BookingInitial()) {
    on<CheckCouponEvent>(_handleCheckCouponEvent);
    on<ConfirmBookingEvent>(_handleConfirmBookingEvent);
    on<UpdateBookingDetails>(_handleUpdateBookingDetails);
    on<DatePicked>(_handleDatePicked); // Added this line
  }

  void _handleCheckCouponEvent(
      CheckCouponEvent event, Emitter<BookingState> emit) async {
    try {
      Coupon? coupon = await _dbService.getCouponByCode(event.couponCode);
      if (coupon != null) {
        totalPrice -= coupon.discountAmount ?? 0;
        emit(CouponValid(coupon));
      } else {
        emit(CouponInvalid());
      }
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  void _handleConfirmBookingEvent(
      ConfirmBookingEvent event, Emitter<BookingState> emit) async {
    try {
      await _dbService.createBooking(event.booking);
      emit(BookingSuccess());
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  void _handleUpdateBookingDetails(
      UpdateBookingDetails event, Emitter<BookingState> emit) {
    basePrice = event.basePrice;
    totalPrice =
        basePrice * (int.tryParse(roomsController.text) ?? 1).toDouble();
    emit(BookingDetailsUpdated());
  }

  void _handleDatePicked(DatePicked event, Emitter<BookingState> emit) {
    dateController.text = event.date;
    emit(BookingDetailsUpdated());
  }
}
