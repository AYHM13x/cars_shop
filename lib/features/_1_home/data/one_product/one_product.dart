import 'product_details.dart';

class OneProduct {
  bool? success;
  ProductsDetails? data;
  String? message;

  OneProduct({this.success, this.data, this.message});

  @override
  String toString() {
    return 'OneProductResponse(success: $success, data: $data, message: $message)';
  }

  factory OneProduct.fromJson(Map<String, dynamic> json) {
    return OneProduct(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : ProductsDetails.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
