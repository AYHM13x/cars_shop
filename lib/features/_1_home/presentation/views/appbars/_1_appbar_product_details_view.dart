import 'package:flutter/material.dart';

import '../sheets/_0_rate_product_sheet.dart';

class AppBarProductdetailsView extends StatelessWidget {
  const AppBarProductdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Cars Shop",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.grey.shade800,
                  context: context,
                  builder: (context) {
                    return const SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: RateProductSheet(),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.star,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_comment,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
