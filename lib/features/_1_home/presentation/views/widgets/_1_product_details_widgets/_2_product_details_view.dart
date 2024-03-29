import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/one_product/one_product.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.oneProduct});

  final OneProduct oneProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          oneProduct.data!.title!,
          style: const TextStyle(
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          oneProduct.data!.description!,
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          "rate: ${oneProduct.data!.rate!.toStringAsPrecision(3)}",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
