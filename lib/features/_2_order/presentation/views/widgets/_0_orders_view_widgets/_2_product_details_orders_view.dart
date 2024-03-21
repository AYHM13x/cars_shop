import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsOrdersView extends StatelessWidget {
  const ProductDetailsOrdersView({
    super.key,
    // required this.product,
  });

  // final ProductAllProducts product;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "product.title!",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Gap(16),
          Text(
            "product.description!",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
