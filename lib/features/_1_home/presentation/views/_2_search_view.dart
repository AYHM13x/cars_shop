import 'package:flutter/material.dart';

import 'bodies/_2_search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
