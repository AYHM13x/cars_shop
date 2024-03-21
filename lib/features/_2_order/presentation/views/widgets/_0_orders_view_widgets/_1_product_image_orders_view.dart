import 'package:flutter/material.dart';

import '../../../../../../core/utils/AsstesApp.dart';

class ProductImageOrdersView extends StatelessWidget {
  const ProductImageOrdersView({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        AssetsImage.carImage,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        // loadingBuilder: (context, child, loadingProgress) {
        //   if (loadingProgress == null) {
        //     return child;
        //   }
        //   return Shimmer.fromColors(
        //     baseColor: Colors.grey.shade800,
        //     highlightColor: Colors.white,
        //     child: Center(
        //       child: Container(
        //         height: 225,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(16),
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   );
        // },
        // errorBuilder: (context, error, stackTrace) {
        //   return const Center(
        //     child: Icon(Icons.error),
        //   );
        // },
      ),
    );
  }
}
