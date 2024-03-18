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

  Future<Either<Failure, Map<String, dynamic>>> postCommentToProduct({
    required String token,
    required int productId,
    required String comment,
  });
  Future<Either<Failure, Map<String, dynamic>>> postRateToProduct({
    required String token,
    required int productId,
    required num rate,
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> postCommentToProduct({
    required String token,
    required int productId,
    required String comment,
  }) async {
    try {
      var data = await apiService.commentProduct(
        productId: productId,
        comment: comment,
        token: token,
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
  Future<Either<Failure, Map<String, dynamic>>> postRateToProduct({
    required String token,
    required int productId,
    required num rate,
  }) async {
    try {
      var data = await apiService.rateProduct(
        productId: productId,
        rate: rate,
        token: token,
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
