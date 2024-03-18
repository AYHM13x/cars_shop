import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../widgets/_2_sheet_items/rate_item.dart';

class RateProductSheet extends StatefulWidget {
  const RateProductSheet({super.key});

  @override
  State<RateProductSheet> createState() => _RateProductSheetState();
}

class _RateProductSheetState extends State<RateProductSheet> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
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
                      BlocProvider.of<AuthCubit>(context)
                          .setChossedRateIndex(index);
                      setState(() {});
                    },
                    child: RateItem(
                      index: index + 1,
                      isSelected: BlocProvider.of<AuthCubit>(context)
                                  .getChossedRateIndex() ==
                              index
                          ? true
                          : false,
                    ),
                  ),
                );
              },
            ),
          ),
          const Gap(16),
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).postRate(
                token: BlocProvider.of<AuthCubit>(context).getToken(),
                productId: BlocProvider.of<AuthCubit>(context)
                    .getSelectedProductIndex(),
                rate:
                    BlocProvider.of<AuthCubit>(context).getChossedRateIndex() +
                        1,
              );
            },
            child: const Text("Confirm"),
          )
        ],
      ),
    );
  }
}
