import 'dart:convert';

import 'data.dart';

class AuthResponse {
  bool? success;
  Data? data;
  String? message;

  AuthResponse({this.success, this.data, this.message});

  @override
  String toString() {
    return 'AuthResponce(success: $success, data: $data, message: $message)';
  }

  factory AuthResponse.fromMap(Map<String, dynamic> data) => AuthResponse(
        success: data['success'] as bool?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'data': data?.toMap(),
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AuthResponse].
  factory AuthResponse.fromJson(String data) {
    return AuthResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AuthResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
