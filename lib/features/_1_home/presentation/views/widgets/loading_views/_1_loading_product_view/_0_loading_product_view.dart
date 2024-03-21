import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/utils/dimensions_of_screen.dart';
import '_1_loading_product_image_view.dart';
import '_2_loading_product_details_view.dart';
import '_3_loading_product_comment_view.dart';

class LoadingProductView extends StatelessWidget {
  const LoadingProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoadingProductImageView(),
          const SizedBox(height: 16),
          const LoadingProductDetailsView(),
          const SizedBox(height: 16),
          SizedBox(
            height: responciveHeight(context),
            child: const LoadingProductCommnetView(),
          ),
        ],
      ),
    );
  }
}
