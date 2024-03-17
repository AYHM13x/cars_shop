import 'datum.dart';

class AllOrders {
  bool? success;
  List<OrderData>? data;
  String? message;

  AllOrders({this.success, this.data, this.message});

  factory AllOrders.fromJson(Map<String, dynamic> json) => AllOrders(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => OrderData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
