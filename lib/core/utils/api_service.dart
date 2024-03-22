import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../features/_0_auth/data/auth_responce/auth_responce.dart';
import '../../features/_2_order/data/all_orders/all_orders.dart';
import '../../features/_1_home/data/all_products/all_products.dart';
import '../../features/_1_home/data/one_product/one_product.dart';

class ApiService {
  final Dio _dio;
  final _baseUrl = "https://event-reg.app/flutter_test/api";

  ApiService(this._dio);

  Future<AuthResponse> loginAccount({
    required String email,
    required String password,
  }) async {
    var response = await _dio.post(
      "$_baseUrl/login?email=$email&password=$password",
      data: [
        {
          "key": "email",
          "value": email,
          "type": "text",
        },
        {
          "key": "password",
          "value": password,
          "type": "text",
        }
      ],
    );
    AuthResponse authResponse = AuthResponse.fromJson(response.toString());
    debugPrint(authResponse.data!.name);
    debugPrint(authResponse.data!.token);
    debugPrint(authResponse.message);
    return authResponse;
  }

  Future<AuthResponse> registerAccount({
    required String name,
    required String email,
    required String password,
    required String cpassword,
  }) async {
    var response = await _dio.post(
      "$_baseUrl/register?name=$name&email=$email&password=$password&c_password=$cpassword",
      data: [
        {
          "key": "name",
          "value": name,
          "type": "text",
        },
        {
          "key": "email",
          "value": email,
          "type": "text",
        },
        {
          "key": "password",
          "value": password,
          "type": "text",
        },
        {
          "key": "c_password",
          "value": cpassword,
          "type": "text",
        }
      ],
    );
    AuthResponse authResponse = AuthResponse.fromJson(response.toString());
    debugPrint(authResponse.data!.name);
    debugPrint(authResponse.data!.token);
    debugPrint(authResponse.message);
    return authResponse;
  }

  Future<AllProducts> getAllProducts({
    required String token,
  }) async {
    var response = await _dio.get(
      "$_baseUrl/products",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );

    AllProducts allProducts = AllProducts.fromJson(response.data);
    return allProducts;
  }

  Future<OneProduct> getOneProduct({
    required int productId,
    required String token,
  }) async {
    var response = await _dio.get(
      "$_baseUrl/products/$productId",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );
    OneProduct oneProduct = OneProduct.fromJson(response.data);
    return oneProduct;
  }

  Future<AllProducts> filterProducts({
    required String title,
    required num rate,
    required String token,
  }) async {
    var response = await _dio.post(
      "$_baseUrl/filter-products?title=$title&rate=$rate",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
      data: [
        {
          "key": "title",
          "value": title,
          "type": "text",
        },
        {
          "key": "rate",
          "value": rate,
          "type": "text",
        }
      ],
    );
    AllProducts allProducts = AllProducts.fromJson(response.data);
    return allProducts;
  }

  Future<Map<String, dynamic>> commentProduct({
    required int productId,
    required String comment,
    required String token,
  }) async {
    var response = await _dio.post(
      "$_baseUrl/comment?product_id=$productId&content=$comment",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
      // data: [
      //   {
      //     "key": "product_id",
      //     "value": productId,
      //     "type": "text",
      //   },
      //   {
      //     "key": "content",
      //     "value": comment,
      //     "type": "text",
      //   },
      // ],
    );
    return response.data;
  }

  Future<Map<String, dynamic>> rateProduct({
    required int productId,
    required num rate,
    required String token,
  }) async {
    var response = await _dio.post(
      "$_baseUrl/rate?product_id=$productId&rate=$rate",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<AllOrders> getAllOrders({
    required String token,
  }) async {
    var response = await _dio.get(
      "$_baseUrl/orders",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    AllOrders allOrders = AllOrders.fromJson(response.data);
    return allOrders;
  }

  Future<Map<String, dynamic>> postOrder({
    required int productId,
    required String token,
  }) async {
    var response = await _dio.post(
      "$_baseUrl/orders?product_id=$productId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> deleteOrder({
    required int orderId,
    required String token,
  }) async {
    var response = await _dio.delete(
      "$_baseUrl/orders/$orderId",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );
    return response.data;
  }
}
