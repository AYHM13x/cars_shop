import 'package:flutter/material.dart';

class ProductImageHomeView extends StatelessWidget {
  const ProductImageHomeView({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl,
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
