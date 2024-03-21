import 'package:flutter/material.dart';

import 'bodies/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OrderViewBody(),
      ),
    );
  }
}
