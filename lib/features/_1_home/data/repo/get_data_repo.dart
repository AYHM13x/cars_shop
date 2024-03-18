import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../../_2_order/data/all_orders/all_orders.dart';
import '../all_products/all_products.dart';
import '../one_product/one_product.dart';

abstract class GetProductsRepo {
  Future<Either<Failure, AllProducts>> getAllProducts({
    required String token,
  });
  Future<Either<Failure, AllProducts>> postFilteredProducts({
    required String token,
    required String title,
    required num rate,
  });
  Future<Either<Failure, OneProduct>> getOneProductWithDetails({
    required String token,
    required int productId,
  });

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

class GetProductsRepoImpl implements GetProductsRepo {
  final ApiService apiService;

  GetProductsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllProducts>> getAllProducts({
    required String token,
  }) async {
    try {
      var data = await apiService.getAllProducts(token: token);
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
  Future<Either<Failure, AllProducts>> postFilteredProducts({
    required String token,
    required String title,
    required num rate,
  }) async {
    try {
      var data = await apiService.filterProducts(
        title: title,
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

  @override
  Future<Either<Failure, OneProduct>> getOneProductWithDetails({
    required String token,
    required int productId,
  }) async {
    try {
      var data = await apiService.getOneProduct(
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
