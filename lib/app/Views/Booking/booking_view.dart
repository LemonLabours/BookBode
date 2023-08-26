import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
import 'package:bookbode/app/Core/utilities/shared/text_fields_widgets.dart';
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

            const SnackBar(content: Text("Booking Successful!")),

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
          backgroundColor: hWhiteColor,
          appBar: AppBar(
              backgroundColor: hWhiteColor,
              elevation: 0,
              title: Text(
                "Booking for ${hotel.name}",
                style: const TextStyle(color: hBlachColor),
              )),
          body: Padding(

            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kVSpace16,
                Row(
                  children: [
                    const Text(
                      'Select Date:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    kVSpace8,
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
                              formattedDate)); 
                        }
                      },
                      child: Text(bloc.dateController.text.isEmpty
                          ? "Select a date"
                          : bloc.dateController.text),
                    ),
                  ],
                ),
                kVSpace16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldWidget(
                      width: 160,
                      prefixIcon: Icons.person_add_alt_sharp,
                      inputType: TextInputType.number,
                      textController: bloc.guestsController,
                      onSubmitted: (value) => bloc
                          .add(UpdateBookingDetails(hotel.price.toDouble())),
                      lebel: "Number of Guests",
                      hintText: '3 person',
                    ),
                    TextFieldWidget(
                      width: 160,
                      prefixIcon: Icons.hotel,
                      inputType: TextInputType.number,
                      textController: bloc.roomsController,
                      onSubmitted: (value) => bloc
                          .add(UpdateBookingDetails(hotel.price.toDouble())),
                      lebel: "Number of Rooms",
                      hintText: '2',
                    ),
                  ],
                ),
                kVSpace16,
                Text(
                  'Price per night x ${bloc.roomsController.text} = ${bloc.totalPrice}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primary),
                ),
                kVSpace32,
                TextFieldWidget(
                  prefixIcon: Icons.money_outlined,
                  inputType: TextInputType.number,
                  textController: bloc.couponController,
                  lebel: "Enter Coupon",
                ),
                kVSpace32,
                Row(
                  children: [
                    FillButtons(
                      width: 190,
                      onPressed: () => bloc
                          .add(CheckCouponEvent(bloc.couponController.text)),
                      text: "Apply Coupon",
                    ),
                    const Spacer(),
                    Text(
                      "Total Price: ${bloc.totalPrice}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                FillButtons(

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

                  text: "Confirm Booking",


                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
