import 'package:flutter/material.dart';

import '../../../data/all_orders/all_orders.dart';
import '../widgets/_0_orders_view_widgets/_0_produc_orders_view.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.allOrders,
  });

  final AllOrders allOrders;

  @override
  Widget build(BuildContext context) {
    if (allOrders.data!.isNotEmpty) {
      return ListView.builder(
        itemCount: allOrders.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ProductOrdersView(
              product: allOrders.data![index],
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text("There Are No Orders"),
      );
    }
  }
}
