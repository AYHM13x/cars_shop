import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/one_product/comment.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key, required this.comment, required this.index});

  final int index;
  final Comment comment;

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
              Text(
                comment.user!.name!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                index.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              comment.content!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
