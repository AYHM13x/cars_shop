import 'package:flutter/material.dart';

import '../../../../data/all_products/product.dart';

class ProductImageHomeView extends StatelessWidget {
  const ProductImageHomeView({
    super.key,
    required this.product,
  });

  final ProductAllProducts product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        product.image!,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(
            child: Text("loading"),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
      ),
    );
  }
}
