import 'package:car_shop_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../appbars/_0_appbar_home_view.dart';
import '../listview/_0_products_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          const Gap(8),
          const AppbarHomeView(),
          SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 89.5),
            child: const ProductsListView(),
          ),
        ],
      ),
    );
  }
}
