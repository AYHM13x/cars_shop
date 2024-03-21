import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:car_shop_app/features/_2_order/data/all_orders/all_orders.dart';
import 'package:car_shop_app/features/_2_order/presentation/model_view/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../data/all_orders/oreder_data.dart';

class ProductDetailsOrdersView extends StatelessWidget {
  const ProductDetailsOrdersView({
    super.key,
    required this.product,
  });

  final OrderData product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.product!.title!,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              IconButton(
                onPressed: () async {
                  BlocProvider.of<OrderCubit>(context).delOrder(
                    token: BlocProvider.of<AuthCubit>(context).getToken(),
                    orderId: product.id!,
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 26,
                ),
              )
            ],
          ),
          const Gap(16),
          Text(
            product.product!.description!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
