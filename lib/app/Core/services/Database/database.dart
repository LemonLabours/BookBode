import '../../../../main.dart';
import '../../../Models/hotel_model.dart';
import '../../../Models/review_model.dart';

class DatabaseService {
  Future<List<Hotel>> getHotels() async {
    final response = await supabase.from('hotels').select('*');

    if (response is Map && response.containsKey('error')) {
      throw Exception(response['error']['message'] ?? 'An error occurred');
    }

    if (response is! List) {
      throw Exception('Unexpected data format.');
    }

    final List<Hotel> hotels =
        (response).map((hotelData) => Hotel.fromJson(hotelData)).toList();

    return hotels;
  }



    Future<List<Review>> getReviewsForHotel(String hotelId) async {
    final response = await supabase.from('reviews').select('*').eq('hotel_id', hotelId);

    if (response is Map && response.containsKey('error')) {
      throw Exception(response['error']['message'] ?? 'An error occurred');
    }

    if (response is! List) {
      throw Exception('Unexpected data format.');
    }

    final List<Review> reviews =
        (response).map((reviewData) => Review.fromMap(reviewData)).toList();

    return reviews;
  }
}
