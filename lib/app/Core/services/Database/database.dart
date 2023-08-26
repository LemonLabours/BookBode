import '../../../../main.dart';
import '../../../Models/booking_model.dart';
import '../../../Models/coupon_model.dart';
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
    final response =
        await supabase.from('reviews').select('*').eq('hotel_id', hotelId);

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

  Future<List<Hotel>> searchHotelsByLocation(String location) async {
    final response = await supabase
        .from('hotels')
        .select('*')
        .ilike('location', '%$location%');

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

  Future<void> createBooking(Booking booking) async {
    final response = await supabase.from('bookings').insert([
      booking.toMap(),
    ]).single();

    if (response is Map && response.containsKey('error')) {
      throw Exception(response['error']['message'] ??
          'An error occurred while creating the booking.');
    }
  }

  Future<void> createReview(Review review) async {
    final response = await supabase.from('reviews').insert([
      review.toMap(),
    ]).single();

    if (response is Map && response.containsKey('error')) {
      throw Exception(response['error']['message'] ?? 'Error creating review.');
    }
  }

  Future<Coupon?> getCouponByCode(String couponCode) async {
    final response = await supabase
        .from('coupons')
        .select('*')
        .eq('code', couponCode)
        .single();

    if (response is Map && response.containsKey('error')) {
      throw Exception(response['error']['message'] ?? 'An error occurred');
    }

    if (response.data == null) {
      return null;
    }

    if (response.data is! Map) {
      throw Exception('Unexpected data format.');
    }

    return Coupon.fromMap(response.data);
  }
}
