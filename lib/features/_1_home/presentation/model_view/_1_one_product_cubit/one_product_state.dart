part of 'one_product_cubit.dart';

@immutable
abstract class OneProductState {}

class OneProductInitial extends OneProductState {}

class OneProductLoading extends OneProductState {}

class OneProductSuccess extends OneProductState {
  final OneProduct oneProduct;

  OneProductSuccess(this.oneProduct);
}

class OneProductSuccessComment extends OneProductState {
  final String message;

  OneProductSuccessComment(this.message);
}

class OneProductSuccessRate extends OneProductState {
  final String message;

  OneProductSuccessRate(this.message);
}

class OneProductFailure extends OneProductState {
  final String errMessage;

  OneProductFailure(this.errMessage);
}
