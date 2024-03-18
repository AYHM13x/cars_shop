import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locater.dart';
import '../../data/repo/get_data_repo.dart';
import '../model_view/one_product_cubit/one_product_cubit.dart';
import '../model_view/products_cubit/products_cubit.dart';
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
          )..getOneProduct(
              token: BlocProvider.of<AuthCubit>(context).getToken(),
              productId:
                  BlocProvider.of<AuthCubit>(context).getSelectedProductIndex(),
            ),
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
