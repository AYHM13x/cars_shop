part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccessGetAllOrders extends OrderState {
  final AllOrders allOrders;

  OrderSuccessGetAllOrders(this.allOrders);
}

class OrderSuccessPostOrder extends OrderState {
  final String message;

  OrderSuccessPostOrder(this.message);
}

class OrderSuccessDeleteOrder extends OrderState {
  final String message;

  OrderSuccessDeleteOrder(this.message);
}

class OrderFailure extends OrderState {
  final String errMessage;

  OrderFailure(this.errMessage);
}
