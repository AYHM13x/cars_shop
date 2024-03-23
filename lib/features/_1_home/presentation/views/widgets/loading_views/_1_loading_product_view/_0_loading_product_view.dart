import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '_1_loading_product_image_view.dart';
import '_2_loading_product_details_view.dart';

class LoadingProductView extends StatelessWidget {
  const LoadingProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingProductImageView(),
          Gap(8),
          LoadingProductDetailsView(),
          Gap(8),
        ],
      ),
    );
  }
}
