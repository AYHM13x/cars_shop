import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingProductDetailsHomeView extends StatelessWidget {
  const LoadingProductDetailsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 13,
          width: 100,
          color: Colors.white,
        ),
        const Gap(8),
        Container(
          height: 60,
          color: Colors.white,
        ),
        const Gap(8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("comments: ??"),
            Text("rate: ?.??"),
          ],
        )
      ],
    );
  }
}
