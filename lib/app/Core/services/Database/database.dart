import '../../../../main.dart';
import '../../../Models/hotel_model.dart';

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
}
