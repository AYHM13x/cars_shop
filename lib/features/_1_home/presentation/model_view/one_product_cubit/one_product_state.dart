part of 'one_product_cubit.dart';

@immutable
abstract class OneProductState {}

class OneProductInitial extends OneProductState {}

class OneProductLoading extends OneProductState {}

class OneProductSuccessProduct extends OneProductState {
  final OneProduct oneProduct;

  OneProductSuccessProduct(this.oneProduct);
}

class OneProductSuccessCommentAndRate extends OneProductState {
  final String message;

  OneProductSuccessCommentAndRate(this.message);
}

class OneProductFailure extends OneProductState {
  final String errMessage;

  OneProductFailure(this.errMessage);
}
