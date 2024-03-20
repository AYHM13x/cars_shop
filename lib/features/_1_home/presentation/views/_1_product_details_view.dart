import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locater.dart';
import '../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../data/repo/get_data_repo.dart';
import '../model_view/one_product_cubit/one_product_cubit.dart';
import 'bodies/_1_product_details_view_body.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).setChossedRateIndex(-1);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: ProductDetailsViewBody(),
        ),
      ),
    );
  }
}
