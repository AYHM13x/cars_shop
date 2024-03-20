import 'package:flutter/material.dart';

class RateItem extends StatelessWidget {
  const RateItem({
    super.key,
    required this.index,
    this.isSelected = false,
  });

  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            //selected color circle
            backgroundColor: Colors.yellow,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 29,
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
          )
        : CircleAvatar(
            //selected color circle
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 29,
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
