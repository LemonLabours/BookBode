class Hotel {
  final String hotelId;
  final String name;
  final String? location;
  final double? rating;
  final String? description;
  final int price;
  final String hotelImage;
  final List<Facility>? facilities;

  Hotel({
    required this.hotelId,
    required this.name,
    this.location,
    this.rating,
    this.description,
    required this.price,
    required this.hotelImage,
    this.facilities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotelId: json['hotel_id'],
      name: json['name'],
      location: json['location'],
      rating: json['rating']?.toDouble(),
      description: json['description'],
      price: json['price'],
      hotelImage: json['hotel_image'],
      facilities: (json['facilities']?['facilities'] as List?)
          ?.map((e) => Facility.fromJson(e))
          .toList(),
    );
  }
}

class Facility {
  final String icon;
  final String facility;

  Facility({required this.icon, required this.facility});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      icon: json['icon'],
      facility: json['facility'],
    );
  }
}
