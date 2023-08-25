class Coupon {
  final String id;
  final DateTime createdAt;
  final String? code;
  final int? discountAmount;

  Coupon({
    required this.id,
    required this.createdAt,
    this.code,
    this.discountAmount,
  });

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      code: map['code'],
      discountAmount: map['discount_amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'code': code,
      'discount_amount': discountAmount,
    };
  }
}
