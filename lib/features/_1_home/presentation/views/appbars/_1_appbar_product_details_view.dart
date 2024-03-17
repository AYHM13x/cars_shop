import 'package:flutter/material.dart';

class AppBarProductdetailsView extends StatelessWidget {
  const AppBarProductdetailsView({super.key});

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
              onPressed: () {},
              icon: const Icon(
                Icons.add_comment,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
