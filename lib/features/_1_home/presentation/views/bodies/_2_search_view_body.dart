import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../model_view/_0_products_cubit/products_cubit.dart';
import '../appbars/_2_appbar_search_view.dart';

import '../listview/_1_search_product_listview.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const AppbarSearchView(),
        const Gap(8),
        CustomTextFormField(
          hintText: "Search",
          onChange: (data) {
            search = data;
            BlocProvider.of<ProductsCubit>(context).searchProduct(data);
          },
        ),
        const Gap(8),
        const SearchProductsListView(),
      ],
    );
  }
}
