import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '_1_loading_product_image_home_view.dart';
import '_2_loading_product_details_home_view.dart';

class LoadingProductHomeView extends StatelessWidget {
  const LoadingProductHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(bottom: 8),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingProductImageHomeView(),
            Gap(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: LoadingProductDetailsHomeView(),
            ),
          ],
        ),
      ),
    );
  }
}
