import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/all_orders/all_orders.dart';
import '../../../data/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;
  AllOrders _allOrders = AllOrders();

  AllOrders getCurrentAllOrder() => _allOrders;

  Future<void> getAllOrders({
    required String token,
  }) async {
    emit(OrderLoading());
    var result = await orderRepo.getAllOrders(token: token);

    result.fold(
      (failure) {
        emit(OrderFailure(failure.errMessage));
      },
      (getAllOrders) {
        _allOrders = getAllOrders;
        emit(OrderSuccessGetAllOrders(getAllOrders));
      },
    );
  }

  Future<void> postOrder({
    required String token,
    required int productId,
  }) async {
    emit(OrderLoading());
    var result = await orderRepo.postOrder(
      token: token,
      productId: productId,
    );

    result.fold(
      (failure) {
        emit(OrderFailure(failure.errMessage));
      },
      (postOrder) {
        emit(
          OrderSuccessPostOrder(
            postOrder["message"],
          ),
        );
      },
    );
  }

  Future<void> delOrder({
    required String token,
    required int orderId,
  }) async {
    emit(OrderLoading());
    var result = await orderRepo.deleteOrder(
      token: token,
      orderId: orderId,
    );

    result.fold(
      (failure) {
        emit(OrderFailure(failure.errMessage));
      },
      (delOrder) {
        emit(
          OrderSuccessPostOrder(
            delOrder["message"],
          ),
        );
      },
    );
  }
}
