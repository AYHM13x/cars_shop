import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/dimensions_of_screen.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../model_view/_1_one_product_cubit/one_product_cubit.dart';
import '../widgets/_1_product_details_widgets/_3_product_comments_list_view.dart';
import '../widgets/loading_views/_1_loading_product_view/_0_loading_product_view.dart';

import '../appbars/_1_appbar_product_details_view.dart';
import '../widgets/_1_product_details_widgets/_0_product_data_view.dart';
import '../widgets/loading_views/_1_loading_product_view/_3_loading_product_comment_view.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const AppBarProductdetailsView(),
        SizedBox(
          height: DimensionsOfScreen.dimensionsOfHeight(context, 89),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    BlocConsumer<OneProductCubit, OneProductState>(
                      listener: (context, state) async {
                        if (state is OneProductLoading) {
                          showSnackBar(context, "Loading...");
                        } else if (state is OneProductFailure) {
                          showSnackBar(context, state.errMessage);
                        } else if (state is OneProductSuccess) {
                          showSnackBar(context, state.oneProduct.message!);
                        } else if (state is OneProductSuccessRate) {
                          await BlocProvider.of<OneProductCubit>(context)
                              .getOneProduct(
                            token:
                                BlocProvider.of<AuthCubit>(context).getToken(),
                            productId: BlocProvider.of<OneProductCubit>(context)
                                .getSelectedProductIndex(),
                          );
                          showSnackBar(context, state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is OneProductSuccess ||
                            state is OneProductSuccessRate) {
                          return ProductView(
                            oneProduct:
                                BlocProvider.of<OneProductCubit>(context)
                                    .getCurrentProduct(),
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
                    //const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Expanded(
                  child: BlocConsumer<OneProductCubit, OneProductState>(
                    listener: (context, state) async {
                      if (state is OneProductLoading) {
                        showSnackBar(context, "Loading...");
                      } else if (state is OneProductFailure) {
                        showSnackBar(context, state.errMessage);
                      } else if (state is OneProductSuccess) {
                        showSnackBar(context, state.oneProduct.message!);
                      } else if (state is OneProductSuccessComment) {
                        await BlocProvider.of<OneProductCubit>(context)
                            .getOneProduct(
                          token: BlocProvider.of<AuthCubit>(context).getToken(),
                          productId: BlocProvider.of<OneProductCubit>(context)
                              .getSelectedProductIndex(),
                        );
                        showSnackBar(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is OneProductSuccess ||
                          state is OneProductSuccessComment) {
                        return ProductCommentsView(
                          oneProduct: BlocProvider.of<OneProductCubit>(context)
                              .getCurrentProduct(),
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
                          child: const LoadingProductCommnetView(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}



// class ProductDetailsViewBody extends StatefulWidget {
//   const ProductDetailsViewBody({super.key});

//   @override
//   State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
// }

// class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 16),
//         const AppBarProductdetailsView(),
//         const SizedBox(height: 16),
//         BlocConsumer<OneProductCubit, OneProductState>(
//           listener: (context, state) async {
//             if (state is OneProductLoading) {
//               showSnackBar(context, "Loading...");
//             } else if (state is OneProductFailure) {
//               showSnackBar(context, state.errMessage);
//             } else if (state is OneProductSuccess) {
//               showSnackBar(context, state.oneProduct.message!);
//             } else if (state is OneProductSuccessComment) {
//               await BlocProvider.of<OneProductCubit>(context).getOneProduct(
//                 token: BlocProvider.of<AuthCubit>(context).getToken(),
//                 productId: BlocProvider.of<OneProductCubit>(context)
//                     .getSelectedProductIndex(),
//               );
//               showSnackBar(context, state.message);
//             } else if (state is OneProductSuccessRate) {
//               await BlocProvider.of<OneProductCubit>(context).getOneProduct(
//                 token: BlocProvider.of<AuthCubit>(context).getToken(),
//                 productId: BlocProvider.of<OneProductCubit>(context)
//                     .getSelectedProductIndex(),
//               );
//               showSnackBar(context, state.message);
//             }
//           },
//           builder: (context, state) {
//             if (state is OneProductSuccess ||
//                 state is OneProductSuccessComment ||
//                 state is OneProductSuccessRate) {
//               return ProductView(
//                 oneProduct: BlocProvider.of<OneProductCubit>(context)
//                     .getCurrentProduct(),
//               );
//             } else if (state is OneProductFailure) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.error),
//                   Text(state.errMessage),
//                 ],
//               );
//             } else if (state is OneProductLoading) {
//               return WillPopScope(
//                 onWillPop: () async {
//                   return false;
//                 },
//                 child: const LoadingProductView(),
//               );
//             } else {
//               return const SizedBox();
//             }
//           },
//         ),
//       ],
//     );
//   }
// }