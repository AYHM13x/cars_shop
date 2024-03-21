import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/api_service.dart';
import 'all_orders/all_orders.dart';

abstract class OrderRepo {
  Future<Either<Failure, AllOrders>> getAllOrders({
    required String token,
  });
  Future<Either<Failure, Map<String, dynamic>>> postOrder({
    required String token,
    required int productId,
  });
  Future<Either<Failure, Map<String, dynamic>>> deleteOrder({
    required String token,
    required int orderId,
  });
}

class OrderRepoImp implements OrderRepo {
  final ApiService apiService;

  OrderRepoImp(this.apiService);

  @override
  Future<Either<Failure, AllOrders>> getAllOrders({
    required String token,
  }) async {
    try {
      var data = await apiService.getAllOrders(token: token);
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
  Future<Either<Failure, Map<String, dynamic>>> postOrder({
    required String token,
    required int productId,
  }) async {
    try {
      var data = await apiService.postOrder(
        productId: productId,
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
  Future<Either<Failure, Map<String, dynamic>>> deleteOrder({
    required String token,
    required int orderId,
  }) async {
    try {
      var data = await apiService.deleteOrder(
        orderId: orderId,
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
