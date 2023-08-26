import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/bloc/order_bloc/order_bloc.dart';
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
                return BookingCard(booking: state.bookings[index]);
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
