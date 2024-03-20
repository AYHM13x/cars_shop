import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/route_app/route_names_app.dart';
import '../../model_view/products_cubit/products_cubit.dart';
import '../widgets/_0_home_view_widgets/_0_product_home_view.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFailure) {
          showSnackBar(context, state.errmessage);
        } else if (state is ProductsSuccessGetAllProducts) {
          showSnackBar(context, state.allProducts.message ?? "");
        }
      },
      builder: (context, state) {
        if (state is ProductsSuccessGetAllProducts) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.allProducts.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<AuthCubit>(context)
                      .setSelectedProductIndex(index + 1);
                  Navigator.pushNamed(
                      context, RouteNamesApp.productDetailsViewRoute);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child:
                      ProductHomeView(product: state.allProducts.data![index]),
                ),
              );
            },
          );
        } else if (state is ProductsFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text(
                state.errmessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          );
        } else {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Center(
              child: Text("loading"),
            ),
          );
        }
      },
    );
  }
}
