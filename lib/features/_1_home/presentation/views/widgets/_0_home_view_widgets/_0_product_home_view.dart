import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/all_products/product.dart';
import '_1_product_image_home_view.dart';
import '_2_product_details_home_view.dart';

class ProductHomeView extends StatelessWidget {
  const ProductHomeView({
    super.key,
    required this.product,
  });

  final ProductAllProducts product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.5),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageHomeView(imageUrl: product.image!),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProductDetailsHomeView(
              product: product,
            ),
          ),
        ],
      ),
    );
  }
}

// Image.network(
//               product.image!,
//               fit: BoxFit.fill,
//               filterQuality: FilterQuality.high,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) {
//                   return child;
//                 }
//                 return const Center(
//                   child: Text("loading"),
//                 );
//               },
//               errorBuilder: (context, error, stackTrace) {
//                 return const Center(
//                   child: Icon(Icons.error),
//                 );
//               },
//             )
