import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../appbars/_0_appbar_home_view.dart';
import '../listview/_0_products_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Gap(8),
          AppbarHomeView(),
          Gap(8),
          ProductsListView(),
        ],
      ),
    );
  }
}
