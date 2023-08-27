class Coupon {
  final String id;
  final String? code;
  final int? discountAmount;

  Coupon({
    required this.id,
    this.code,
    this.discountAmount,
  });

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      id: map['id'],
      code: map['code'],
      discountAmount: map['discount_amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'discount_amount': discountAmount,
    };
  }
}
