import 'package:flutter/material.dart';

import '../widgets/_0_orders_view_widgets/_0_produc_orders_view.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: ProductOrdersView(),
        );
      },
    );
  }
}
