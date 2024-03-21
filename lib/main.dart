import 'package:car_shop_app/core/utils/route_app/slide_left_animetion.dart';
import 'package:car_shop_app/features/_1_home/presentation/model_view/products_cubit/products_cubit.dart';
import 'package:car_shop_app/features/_2_order/data/order_repo.dart';
import 'package:car_shop_app/features/_2_order/presentation/model_view/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/route_app/scale_animetion.dart';
import 'core/utils/route_app/slide_right_animetion.dart';
import 'core/utils/route_app/route_names_app.dart';
import 'core/utils/service_locater.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/_0_auth/data/repo/auth_repo.dart';
import 'features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'features/_0_auth/presentation/views/log_in_view.dart';
import 'features/_0_auth/presentation/views/sign_up_view.dart';
import 'features/_1_home/data/repo/get_data_repo.dart';
import 'features/_1_home/presentation/model_view/one_product_cubit/one_product_cubit.dart';
import 'features/_1_home/presentation/views/_0_home_view.dart';
import 'features/_1_home/presentation/views/_1_product_details_view.dart';
import 'features/_2_order/presentation/views/order_view.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocater();

  runApp(const CarShopApp());
}

class CarShopApp extends StatelessWidget {
  const CarShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(
            getIt.get<GetProductsRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => OneProductCubit(
            getIt.get<GetProductsRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => OrderCubit(
            getIt.get<OrderRepoImp>(),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == RouteNamesApp.signUpViewRoute) {
            return SlideRight(child: const SignUpView());
          } else if (settings.name == RouteNamesApp.homeViewRoute) {
            return ScaleAnmetion(child: const HomeView());
          } else if (settings.name == RouteNamesApp.productDetailsViewRoute) {
            return ScaleAnmetion(child: const ProductDetailsView());
          } else if (settings.name == RouteNamesApp.orderViewRoute) {
            return SlideLeft(child: const OrderView());
          } else {
            return MaterialPageRoute(builder: (_) => const LogInView());
          }
        },
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        title: "Cars Shop",
        // routes: {
        //   RouteNamesApp.signInViewRoute: (context) => const LogInView(),
        //   RouteNamesApp.signUpViewRoute: (context) => const SignUpView(),
        //   RouteNamesApp.homeViewRoute: (context) => const HomeView(),
        //   RouteNamesApp.productDetailsViewRoute: (context) =>
        //       const ProductDetailsView(),
        // },
        initialRoute: RouteNamesApp.logInViewRoute,
      ),
    );
  }
}
