import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../model_view/_1_one_product_cubit/one_product_cubit.dart';
import '../widgets/sheet_items/rate_item.dart';

class RateProductSheet extends StatefulWidget {
  const RateProductSheet({super.key});

  @override
  State<RateProductSheet> createState() => _RateProductSheetState();
}

class _RateProductSheetState extends State<RateProductSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        const Text(
          "Chose your rate:",
          style: TextStyle(fontSize: 28),
        ),
        const Gap(16),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 10),
          child: ListView.builder(
            itemExtent: 75,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.zero,
            itemBuilder: (content, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<OneProductCubit>(context)
                        .setChossedRateIndex(index + 1);
                    setState(() {});
                  },
                  child: RateItem(
                    index: index + 1,
                    isSelected: BlocProvider.of<OneProductCubit>(context)
                                .getChossedRateIndex() ==
                            index + 1
                        ? true
                        : false,
                  ),
                ),
              );
            },
          ),
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () async {
                BlocProvider.of<OneProductCubit>(context)
                    .setIsLoadingRate(true);
                if (BlocProvider.of<OneProductCubit>(context)
                        .getChossedRateIndex() !=
                    -1) {
                  await BlocProvider.of<OneProductCubit>(context).postRate(
                    token: BlocProvider.of<AuthCubit>(context).getToken(),
                    productId: BlocProvider.of<OneProductCubit>(context)
                        .getSelectedProductIndex(),
                    rate: BlocProvider.of<OneProductCubit>(context)
                        .getChossedRateIndex(),
                  );
                  BlocProvider.of<OneProductCubit>(context)
                      .setIsLoadingRate(false);
                }
                // await Future.delayed(const Duration(milliseconds: 1000));
                if (!BlocProvider.of<OneProductCubit>(context)
                    .getIsLoadingRate()) {
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Confirm",
                style: TextStyle(
                  // decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
            ),
            const Gap(16),
          ],
        ),
        const Gap(22),
      ],
    );
  }
}
