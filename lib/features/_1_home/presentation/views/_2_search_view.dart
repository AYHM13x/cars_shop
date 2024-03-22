import 'package:flutter/material.dart';

import 'bodies/_2_search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    double keyBoardIsShow = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: keyBoardIsShow,
          ),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
