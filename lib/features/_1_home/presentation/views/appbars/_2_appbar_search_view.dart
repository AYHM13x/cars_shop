import 'package:flutter/material.dart';

class AppbarSearchView extends StatelessWidget {
  const AppbarSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Search",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
