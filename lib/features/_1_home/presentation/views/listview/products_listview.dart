import 'package:car_shop_app/core/utils/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ProductHomeView(product: state.allProducts.data![index]),
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
          return const Center(
            child: Text("loading"),
          );
        }
      },
    );
  }
}
