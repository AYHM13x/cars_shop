import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../widgets/loading_views/_1_loading_product_view/_0_loading_product_view.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../model_view/one_product_cubit/one_product_cubit.dart';
import '../appbars/_1_appbar_product_details_view.dart';
import '../widgets/_1_product_details_widgets/_0_product_data_view.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const AppBarProductdetailsView(),
        const SizedBox(height: 16),
        BlocConsumer<OneProductCubit, OneProductState>(
          listener: (context, state) {
            if (state is OneProductLoading) {
              showSnackBar(context, "Loading...");
            } else if (state is OneProductFailure) {
              showSnackBar(context, state.errMessage);
            } else if (state is OneProductSuccess) {
              showSnackBar(context, state.oneProduct.message!);
            } else if (state is OneProductSuccessComment) {
              showSnackBar(context, state.message);
            } else if (state is OneProductSuccessRate) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is OneProductSuccess) {
              return ProductView(
                oneProduct: state.oneProduct,
              );
            } else if (state is OneProductFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  Text(state.errMessage),
                ],
              );
            } else if (state is OneProductLoading) {
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: const LoadingProductView(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

// class ProductDetailsViewBody extends StatelessWidget {
//   const ProductDetailsViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       physics: const BouncingScrollPhysics(),
//       slivers: [
//         const SliverToBoxAdapter(
//           child: Column(
//             children: [
//               SizedBox(height: 8),
//               AppBarProductdetailsView(),
//               SizedBox(height: 16),
//               ProductView(),
//               SizedBox(height: 16),
//             ],
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: SizedBox(
//             height: DimensionsOfScreen.dimensionsOfHeight(context, 70),
//             child: const ProductCommentsView(),
//           ),
//         )
//       ],
//     );
//   }
// }
