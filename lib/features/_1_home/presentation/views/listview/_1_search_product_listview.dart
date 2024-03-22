import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_view/_0_products_cubit/products_cubit.dart';
import '../widgets/_0_home_view_widgets/_0_product_home_view.dart';

class SearchProductsListView extends StatefulWidget {
  const SearchProductsListView({super.key});

  @override
  State<SearchProductsListView> createState() => _SearchProductsListViewState();
}

class _SearchProductsListViewState extends State<SearchProductsListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsSuccessGetFilteredProducts) {
          setState(() {});
          //showSnackBar(context, "search done");
        }
      },
      builder: (context, state) {
        if (state is ProductsSuccessGetFilteredProducts) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.filteredProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    // BlocProvider.of<OneProductCubit>(context)
                    //     .setSelectedProductIndex(index + 1);
                    // Navigator.pushNamed(context, RouteNamesApp.productDetailsViewRoute)
                    //     .then((_) async {
                    //   await BlocProvider.of<ProductsCubit>(context).getAllProducts(
                    //     token: BlocProvider.of<AuthCubit>(context).getToken(),
                    //   );
                    // });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child:
                        ProductHomeView(product: state.filteredProducts[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is ProductsLoading) {
          return const Center(
            child: Text("Loading"),
          );
        } else {
          return const Center(
            child: Text("enter your search"),
          );
        }
      },
    );
  }
}
