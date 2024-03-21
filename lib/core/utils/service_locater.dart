import 'package:car_shop_app/features/_1_home/data/repo/get_data_repo.dart';
import 'package:car_shop_app/features/_2_order/data/order_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/_0_auth/data/repo/auth_repo.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocater() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<GetProductsRepoImpl>(
    GetProductsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<OrderRepoImp>(
    OrderRepoImp(
      getIt.get<ApiService>(),
    ),
  );
}
