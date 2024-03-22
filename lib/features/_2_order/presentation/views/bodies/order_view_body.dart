import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../model_view/order_cubit/order_cubit.dart';
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
          Expanded(
            child: BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) async {
                if (state is OrderLoading) {
                  showSnackBar(context, "Loading...");
                }
                if (state is OrderFailure) {
                  showSnackBar(context, state.errMessage);
                }
                if (state is OrderSuccessGetAllOrders) {
                  if (state.allOrders.data!.isNotEmpty) {
                    showSnackBar(context, state.allOrders.message!);
                  }
                }
                if (state is OrderSuccessDeleteOrder) {
                  await BlocProvider.of<OrderCubit>(context).getAllOrders(
                    token: BlocProvider.of<AuthCubit>(context).getToken(),
                  );
                  showSnackBar(context, state.message);
                }
                if (state is OrderSuccessPostOrder) {
                  showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is OrderSuccessGetAllOrders ||
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
