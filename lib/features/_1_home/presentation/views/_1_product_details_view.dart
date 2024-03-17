import 'package:car_shop_app/constans.dart';
import 'package:car_shop_app/core/utils/service_locater.dart';
import 'package:car_shop_app/features/_1_home/presentation/model_view/one_product_cubit/one_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/get_data_repo.dart';
import 'bodies/_1_product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OneProductCubit(
            getIt.get<GetProductsRepoImpl>(),
          )..getOneProduct(token: kToken, productId: 2),
          child: const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: ProductDetailsViewBody(),
          ),
        ),
      ),
    );
  }
}
