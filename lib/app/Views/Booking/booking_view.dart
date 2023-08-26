import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../main.dart';
import '../../Core/bloc/booking_bloc/booking_bloc.dart';
import '../../Models/booking_model.dart';
import '../../Models/hotel_model.dart';

class BookingView extends StatelessWidget {
  final Hotel hotel;
  final userId = supabase.auth.currentUser?.id;

  BookingView({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Booking Successful!")),
          );
        } else if (state is BookingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<BookingBloc>(context);
        bloc.basePrice = hotel.price.toDouble();

        return Scaffold(
          appBar: AppBar(title: Text("Booking for ${hotel.name}")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Date:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(picked);
                      bloc.dateController.text = formattedDate;
                      bloc.add(DatePicked(
                          formattedDate)); // Inform BLoC of the date change
                    }
                  },
                  child: Text(bloc.dateController.text.isEmpty
                      ? "Select a date"
                      : bloc.dateController.text),
                ),
                TextField(
                  controller: bloc.guestsController,
                  onChanged: (value) =>
                      bloc.add(UpdateBookingDetails(hotel.price.toDouble())),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number of Guests',
                  ),
                ),
                TextField(
                  controller: bloc.roomsController,
                  onChanged: (value) =>
                      bloc.add(UpdateBookingDetails(hotel.price.toDouble())),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number of Rooms',
                  ),
                ),
                Text(
                  'Price per night x ${bloc.roomsController.text} = ${bloc.totalPrice}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: bloc.couponController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Coupon',
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      bloc.add(CheckCouponEvent(bloc.couponController.text)),
                  child: const Text("Apply Coupon"),
                ),
                Text("Total Price: ${bloc.totalPrice}"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    var uuid = const Uuid();
                    Booking booking = Booking(
                      bookingId: uuid.v4(),
                      createdAt: DateTime.now(),
                      checkInDate: bloc.dateController.text,
                      totalPrice: bloc.totalPrice,
                      hotelId: hotel.hotelId,
                      customerId: userId,
                    );
                    bloc.add(ConfirmBookingEvent(booking));
                  },
                  child: const Text("Confirm Booking"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
