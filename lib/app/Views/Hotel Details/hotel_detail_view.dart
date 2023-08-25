import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Core/services/Database/database.dart';
import '../../Core/utilities/shared/sheet_layout_widget.dart';
import '../../Models/hotel_model.dart';
import '../../Models/review_model.dart';
import 'widgets/booking_buttons.dart';
import 'widgets/description.dart';
import 'widgets/facilities.dart';
import 'widgets/hotel_name.dart';
import 'widgets/rating_and_reviews.dart';
import 'widgets/review_section.dart';

class HotelDetailsView extends StatefulWidget {
  final Hotel hotel;

  const HotelDetailsView({Key? key, required this.hotel}) : super(key: key);

  @override
  createState() => _HotelDetailsViewState();
}

class _HotelDetailsViewState extends State<HotelDetailsView> {
  List<Review>? _reviews;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    try {
      _reviews = await DatabaseService().getReviewsForHotel(widget.hotel.hotelId);
      setState(() => _isLoading = false);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching reviews: $e');
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HotelImage(imageUrl: widget.hotel.hotelImage),
          const GradientOverlay(),
          BottomContainer(
            child: HotelDetailsContent(
              hotel: widget.hotel,
              reviews: _reviews,
              isLoading: _isLoading,
            ),
          ),
        ],
      ),
    );
  }
}

class HotelImage extends StatelessWidget {
  final String imageUrl;

  const HotelImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: MediaQuery.of(context).size.height * 0.36,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

class GradientOverlay extends StatelessWidget {
  const GradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.2],
        ),
      ),
    );
  }
}

class HotelDetailsContent extends StatelessWidget {
  final Hotel hotel;
  final List<Review>? reviews;
  final bool isLoading;

  const HotelDetailsContent({super.key, 
    required this.hotel,
    required this.reviews,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelName(name: hotel.name),
          HotelLocation(location: hotel.location),
          RatingAndReviews(hotelRating: hotel.rating, reviews: reviews),
          Description(title: 'Description', description: hotel.description),
          Facilities(facilities: hotel.facilities),
          ReviewSection(isLoading: isLoading, reviews: reviews),
          const BookingButtons()
        ],
      ),
    );
  }
}

