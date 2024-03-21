import 'package:car_shop_app/core/utils/dimensions_of_screen.dart';
import 'package:car_shop_app/core/utils/functions/show_snack_bar.dart';
import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:car_shop_app/features/_2_order/presentation/model_view/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../appbars/appbar_order_view.dart';
import '../listViews/orders_listview.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).getAllOrders(
      token: BlocProvider.of<AuthCubit>(context).getToken(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          const Gap(16),
          const AppbarOrderView(),
          const Gap(16),
          SizedBox(
            height: DimensionsOfScreen.dimensionsOfHeight(context, 89.5),
            child: BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) {
                if (state is OrderLoading) {
                  showSnackBar(context, "Loading...");
                }
                if (state is OrderFailure) {
                  showSnackBar(context, state.errMessage);
                }
                if (state is OrderSuccessGetAllOrders) {
                  showSnackBar(context, state.allOrders.message!);
                }
                if (state is OrderSuccessDeleteOrder) {
                  showSnackBar(context, state.message);
                }
                if (state is OrderSuccessPostOrder) {
                  showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is OrderSuccessGetAllOrders ||
                    state is OrderSuccessPostOrder ||
                    state is OrderSuccessDeleteOrder) {
                  return OrdersListView(
                    allOrders: BlocProvider.of<OrderCubit>(context)
                        .getCurrentAllOrder(),
                  );
                } else if (state is OrderFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else if (state is OrderLoading) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
