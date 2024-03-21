import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:car_shop_app/features/_1_home/presentation/model_view/one_product_cubit/one_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../data/one_product/one_product.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.oneProduct});

  final OneProduct oneProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          oneProduct.data!.title!,
          style: const TextStyle(
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        Text(
          oneProduct.data!.description!,
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        BlocListener<OneProductCubit, OneProductState>(
          listener: (context, state) {
            if (state is OneProductSuccessRate) {
              BlocProvider.of<OneProductCubit>(context).getOneProduct(
                token: BlocProvider.of<AuthCubit>(context).getToken(),
                productId: BlocProvider.of<OneProductCubit>(context)
                    .getSelectedProductIndex(),
              );
            }
          },
          child: Text(
            "rate: ${oneProduct.data!.rate!.toStringAsPrecision(3)}",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
