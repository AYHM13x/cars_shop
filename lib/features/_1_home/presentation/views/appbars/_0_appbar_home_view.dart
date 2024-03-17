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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt,
            size: 28,
          ),
        ),
      ],
    );
  }
}
