import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';

class RateProductSheet extends StatelessWidget {
  const RateProductSheet({super.key});

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
              itemBuilder: (content, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    onTap: () {},
                    child: RateItem(
                      index: index + 1,
                    ),
                  ),
                );
              },
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}

class RateItem extends StatelessWidget {
  const RateItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //selected color circle
      backgroundColor: Colors.white,
      radius: 29,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 25,
        child: Text(
          index.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
