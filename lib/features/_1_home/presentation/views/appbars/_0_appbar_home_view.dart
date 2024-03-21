import 'package:car_shop_app/core/utils/route_app/route_names_app.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.filter_alt,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
