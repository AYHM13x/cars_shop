import 'package:car_shop_app/core/utils/AsstesApp.dart';
import 'package:flutter/material.dart';

class LoadingProductImageHomeView extends StatelessWidget {
  const LoadingProductImageHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        AssetsImage.carImage,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
        height: 225,
      ),
    );
  }
}
