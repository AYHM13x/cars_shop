import 'package:car_shop_app/features/_1_home/data/one_product/one_product.dart';
import 'package:flutter/material.dart';

import '_4_comment_view.dart';

class ProductCommentsView extends StatelessWidget {
  const ProductCommentsView({super.key, required this.oneProduct});

  final OneProduct oneProduct;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: CommentView(
            index: index + 1,
            comment: oneProduct.data!.comments![index],
          ),
        );
      },
    );
  }
}
