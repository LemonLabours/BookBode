// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/bloc/order_bloc/order_bloc.dart';
import '../../Core/services/Database/database.dart';
import 'widgets/booking_card.dart';
import '../../../../main.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final String? userId = supabase.auth.currentUser?.id;

  @override
  void initState() {
    super.initState();
    if (userId != null) {
      context.read<OrderBloc>().add(LoadBookings(userId!));
    }
  }

  Future<void> _deleteBooking(String bookingId) async {
    try {
      await DatabaseService().deleteBooking(bookingId);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking deleted successfully.')));
      // Trigger another load to refresh the list of bookings
      context.read<OrderBloc>().add(LoadBookings(userId!));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error deleting booking: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const CircularProgressIndicator();
          } else if (state is OrderError) {
            return Text('Error: ${state.message}');
          } else if (state is OrderLoaded && state.bookings.isNotEmpty) {
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (context, index) {
                final booking = state.bookings[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    _deleteBooking(booking.bookingId);
                  },
                  child: BookingCard(booking: booking),
                );
              },
            );
          } else {
            return const Text('No bookings found.');
          }
        },
      ),
    );
  }
}
