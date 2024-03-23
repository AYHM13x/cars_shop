import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/route_app/route_names_app.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../model_view/_0_products_cubit/products_cubit.dart';

class AppbarHomeView extends StatelessWidget {
  const AppbarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Cars Shop",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNamesApp.orderViewRoute);
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNamesApp.searchViewRoute)
                    .then((_) async {
                  BlocProvider.of<ProductsCubit>(context).getAllProducts(
                    token: BlocProvider.of<AuthCubit>(context).getToken(),
                  );
                });
              },
              icon: const Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
