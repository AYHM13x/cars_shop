import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:car_shop_app/features/_1_home/presentation/model_view/one_product_cubit/one_product_cubit.dart';
import 'package:car_shop_app/features/_2_order/presentation/model_view/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sheets/_0_rate_product_sheet.dart';
import '../sheets/_1_comment_product_sheet.dart';

class AppBarProductdetailsView extends StatelessWidget {
  const AppBarProductdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Cars Shop",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.grey.shade800,
                  context: context,
                  builder: (context) {
                    return const SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: RateProductSheet(),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.star,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.grey.shade800,
                  context: context,
                  builder: (context) {
                    double keyBoardIsShow =
                        MediaQuery.of(context).viewInsets.bottom;
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: keyBoardIsShow,
                      ),
                      child: const SingleChildScrollView(
                        child: CommentProductSheet(),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.add_comment,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () async {
                await BlocProvider.of<OrderCubit>(context).postOrder(
                  token: BlocProvider.of<AuthCubit>(context).getToken(),
                  productId: BlocProvider.of<OneProductCubit>(context)
                      .getSelectedProductIndex(),
                );
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
