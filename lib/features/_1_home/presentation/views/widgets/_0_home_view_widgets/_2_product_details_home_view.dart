import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/all_products/product.dart';

class ProductDetailsHomeView extends StatelessWidget {
  const ProductDetailsHomeView({super.key, required this.product});

  final ProductAllProducts product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title!),
          const Gap(16),
          Text(
            product.description!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("comments: ${product.comments}"),
              Text("rate: ${product.rate!.toStringAsPrecision(3)}"),
            ],
          )
        ],
      ),
    );
  }
}
