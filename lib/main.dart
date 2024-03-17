import 'package:car_shop_app/features/_1_home/presentation/views/_1_product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/RouteApp.dart';
import 'core/utils/service_locater.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/_0_auth/data/repo/auth_repo.dart';
import 'features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'features/_0_auth/presentation/views/log_in_view.dart';
import 'features/_0_auth/presentation/views/sign_up_view.dart';
import 'features/_1_home/presentation/views/_0_home_view.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocater();

  runApp(const CarShopApp());
}

class CarShopApp extends StatelessWidget {
  const CarShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        title: "Cars Shop",
        routes: {
          RouteApp.signInViewRoute: (context) => const LogInView(),
          RouteApp.signUpViewRoute: (context) => const SignUpView(),
          RouteApp.homeViewRoute: (context) => const HomeView(),
          RouteApp.productDetailsViewRoute: (context) =>
              const ProductDetailsView(),
        },
        initialRoute: RouteApp.productDetailsViewRoute,
      ),
    );
  }
}
