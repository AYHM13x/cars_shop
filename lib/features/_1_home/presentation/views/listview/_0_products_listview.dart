import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/route_app/route_names_app.dart';
import '../../model_view/_0_products_cubit/products_cubit.dart';
import '../../model_view/_1_one_product_cubit/one_product_cubit.dart';
import '../widgets/loading_views/_0_loading_home_view/_0_loading_product_home_view.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../widgets/_0_home_view_widgets/_0_product_home_view.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView({super.key});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getAllProducts(
      token: BlocProvider.of<AuthCubit>(context).getToken(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFailure) {
          showSnackBar(context, state.errmessage);
        } else if (state is ProductsSuccessGetAllProducts) {
          showSnackBar(context, state.allProducts.message!);
        }
      },
      builder: (context, state) {
        if (state is ProductsSuccessGetAllProducts) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.allProducts.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  BlocProvider.of<OneProductCubit>(context)
                      .setSelectedProductIndex(index + 1);
                  Navigator.pushNamed(
                          context, RouteNamesApp.productDetailsViewRoute)
                      .then((_) async {
                    await BlocProvider.of<ProductsCubit>(context)
                        .getAllProducts(
                      token: BlocProvider.of<AuthCubit>(context).getToken(),
                    );
                  });
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: LoadingProductHomeView(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
