import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingCommentView extends StatelessWidget {
  const LoadingCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                height: 19,
                color: Colors.yellow,
              ),
              const Text(
                "??",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              width: double.maxFinite,
              height: 19,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
