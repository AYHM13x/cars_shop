import 'package:car_shop_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../appbars/appbar_order_view.dart';
import '../listViews/orders_listview.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        const AppbarOrderView(),
        const Gap(16),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 88),
          child: const OrdersListView(),
        ),
      ],
    );
  }
}
