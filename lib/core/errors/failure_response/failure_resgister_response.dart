import 'problem_cause.dart';

class FailureResgisterResponse {
  bool? success;
  String? message;
  ProblemCause? data;

  FailureResgisterResponse({this.success, this.message, this.data});

  @override
  String toString() {
    return 'FailureResponse(success: $success, message: $message, data: $data)';
  }

  factory FailureResgisterResponse.fromJson(Map<String, dynamic> json) {
    return FailureResgisterResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProblemCause.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
