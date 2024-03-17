import 'product.dart';
import 'user.dart';

class OrderData {
  int? id;
  int? userId;
  int? productId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  ProductAllOrders? product;

  OrderData({
    this.id,
    this.userId,
    this.productId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.product,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        productId: json['product_id'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        product: json['product'] == null
            ? null
            : ProductAllOrders.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'product_id': productId,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
        'product': product?.toJson(),
      };
}
