import 'product.dart';

class AllProducts {
  bool? success;
  List<ProductAllProducts>? data;
  String? message;

  AllProducts({this.success, this.data, this.message});

  @override
  String toString() {
    return 'Products(success: $success, data: $data, message: $message)';
  }

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ProductAllProducts.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
