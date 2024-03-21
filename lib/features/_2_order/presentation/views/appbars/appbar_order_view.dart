import 'package:flutter/material.dart';

class AppbarOrderView extends StatelessWidget {
  const AppbarOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Orders",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
