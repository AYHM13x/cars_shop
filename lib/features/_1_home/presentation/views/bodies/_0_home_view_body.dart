import 'package:car_shop_app/core/utils/dimensions_of_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../appbars/_0_appbar_home_view.dart';
import '../listview/products_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double keyBoardIsShow = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: keyBoardIsShow,
      ),
      child: Column(
        children: [
          const Gap(8),
          const AppbarHomeView(),
          SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 88),
            child: const ProductsListView(),
          ),
        ],
      ),
    );
  }
}
