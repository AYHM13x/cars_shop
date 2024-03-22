import 'package:flutter/material.dart';

import '../../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../data/one_product/one_product.dart';
import '_1_product_image_details_view.dart';
import '_2_product_details_view.dart';
import '_3_product_comments_list_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.oneProduct});

  final OneProduct oneProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductImageDetailsView(
          imageUrl: oneProduct.data!.image!,
        ),
        const SizedBox(height: 16),
        ProductDetailsView(
          oneProduct: oneProduct,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: responciveHeight(context),
          child: ProductCommentsView(
            oneProduct: oneProduct,
          ),
        ),
      ],
    );
  }
}
