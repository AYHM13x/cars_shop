import 'package:car_shop_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locater.dart';
import '../../data/repo/get_data_repo.dart';
import '../model_view/products_cubit/products_cubit.dart';
import 'bodies/_0_home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProductsCubit(
            getIt.get<GetProductsRepoImpl>(),
          )..getAllProducts(
              token: kToken,
            ),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}