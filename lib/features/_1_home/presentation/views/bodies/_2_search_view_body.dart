import 'package:car_shop_app/features/_1_home/presentation/model_view/_0_products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
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
        const Gap(16),
        const AppbarSearchView(),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: DimensionsOfScreen.dimensionsOfWidth(context, 80),
              child: CustomTextFormField(
                hintText: "Search",
                onChange: (data) {
                  search = data;
                  BlocProvider.of<ProductsCubit>(context).searchProduct(data);
                },
              ),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<ProductsCubit>(context).searchProduct(search);
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 81.2),
          child: const SearchProductsListView(),
        ),
      ],
    );
  }
}
