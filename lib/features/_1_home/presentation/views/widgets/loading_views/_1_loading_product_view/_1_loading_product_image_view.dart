import 'package:flutter/material.dart';

import '../../../../../../../core/utils/AsstesApp.dart';

class LoadingProductImageView extends StatelessWidget {
  const LoadingProductImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          AssetsImage.carImage,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
