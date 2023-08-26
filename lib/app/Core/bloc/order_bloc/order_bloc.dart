import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../../../Models/booking_model.dart';
import '../../services/Database/database.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final DatabaseService _databaseService = DatabaseService();
  OrderBloc() : super(OrderInitial()) {
    on<LoadBookings>((event, emit) async {
      emit(OrderLoading());

      try {
        final bookings =
            await _databaseService.getBookingsForCustomer(event.userId);
        emit(OrderLoaded(bookings));
      } catch (error) {
        emit(OrderError(error.toString()));
      }
    });
  }
}
