import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingProductDetailsView extends StatelessWidget {
  const LoadingProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 25,
          color: Colors.white,
        ),
        const Gap(8),
        Container(
          height: 75,
          color: Colors.white,
        ),
        const Gap(8),
        const Text(
          "rate: ?.??",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
