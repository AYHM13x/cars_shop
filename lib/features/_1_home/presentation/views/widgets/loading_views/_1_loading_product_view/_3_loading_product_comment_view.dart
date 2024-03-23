import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '_4_loading_comment_view.dart';

class LoadingProductCommnetView extends StatelessWidget {
  const LoadingProductCommnetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.white,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 7,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: LoadingCommentView(),
            );
          },
        ),
      ),
    );
  }
}
