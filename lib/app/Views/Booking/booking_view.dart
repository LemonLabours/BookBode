import 'package:flutter/material.dart';
import '../../Core/services/Database/database.dart';
import '../../Models/booking_model.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
   createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Booking _booking;

  final TextEditingController _hotelIdController = TextEditingController();
  final TextEditingController _checkInDateController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _customerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Booking')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _hotelIdController,
                decoration: const InputDecoration(labelText: 'Hotel ID'),
                validator: (value) => value!.isEmpty ? 'Please enter hotel ID' : null,
              ),
              TextFormField(
                controller: _checkInDateController,
                decoration: const InputDecoration(labelText: 'Check In Date (YYYY-MM-DD)'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter check in date';
                  try {
                    DateTime.parse(value);
                    return null;
                  } catch (e) {
                    return 'Invalid date format';
                  }
                },
              ),
              TextFormField(
                controller: _totalPriceController,
                decoration: const InputDecoration(labelText: 'Total Price'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Please enter total price' : null,
              ),
              TextFormField(
                controller: _customerIdController,
                decoration: const InputDecoration(labelText: 'Customer ID'),
                validator: (value) => value!.isEmpty ? 'Please enter customer ID' : null,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit Booking'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _booking = Booking(
        bookingId: '', // Generate this dynamically or let the database do it
        createdAt: DateTime.now(),
        hotelId: _hotelIdController.text,
        checkInDate: DateTime.parse(_checkInDateController.text),
        totalPrice: double.parse(_totalPriceController.text),
        customerId: _customerIdController.text,
      );

      try {
        // Store the booking in the database
        await DatabaseService().createBooking(_booking); // Note: You need to add createBooking method to your DatabaseService
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking created successfully!'))
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating booking: $e'))
        );
      }
    }
  }
}
