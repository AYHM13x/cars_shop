import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../auth_responce/auth_responce.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> logInPostRequest({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResponse>> signUpPostRequest({
    required String name,
    required String email,
    required String password,
    required String cpassword,
  });
}

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthResponse>> logInPostRequest({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiService.loginAccount(
        email: email,
        password: password,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure("There was an Error: $e"));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signUpPostRequest({
    required String name,
    required String email,
    required String password,
    required String cpassword,
  }) async {
    try {
      dynamic data = await apiService.registerAccount(
        name: name,
        email: email,
        password: password,
        cpassword: cpassword,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure("There was an Error: $e"));
    }
  }
}
