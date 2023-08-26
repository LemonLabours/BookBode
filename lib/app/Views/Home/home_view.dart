import 'package:bookbode/app/Views/Home/widgets/favorite_place.dart';
import 'package:flutter/material.dart';
import '../../Models/hotel_model.dart';
import '../../Core/services/Database/database.dart';

import 'widgets/cities_widget.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/hotel_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final DatabaseService _databaseService = DatabaseService();

  late Future<List<Hotel>> _hotelsFuture;

  @override
  void initState() {
    super.initState();
    _hotelsFuture = _databaseService.getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Hotel>>(
          future: _hotelsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No hotels found.');
            } else {
              return Column(
                children: [
                  const HomeAppBar(),
                  const CitiesWidget(),
                  const FavoritePlae(),
                  Expanded(
                    child: HotelListView(hotels: snapshot.data!),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
