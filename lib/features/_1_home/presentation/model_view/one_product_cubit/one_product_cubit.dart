import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/one_product/one_product.dart';
import '../../../data/repo/get_data_repo.dart';

part 'one_product_state.dart';

class OneProductCubit extends Cubit<OneProductState> {
  OneProductCubit(this.getProductsRepo) : super(OneProductInitial());

  final GetProductsRepo getProductsRepo;
  String _message = "";
  String _token = "";

  String getMesage() => _message;

  String getToken() => _token;

  Future<void> getOneProduct({
    required String token,
    required int productId,
  }) async {
    _message = "";
    _token = token;
    emit(OneProductLoading());
    var result = await getProductsRepo.getOneProductWithDetails(
      token: token,
      productId: productId,
    );

    result.fold(
      (failure) {
        emit(
          OneProductFailure(
            failure.errMessage,
          ),
        );
      },
      (getOneproduct) {
        _message = getOneproduct.message!;
        emit(
          OneProductSuccessProduct(
            getOneproduct,
          ),
        );
      },
    );
  }

  Future<void> postComment({
    required String token,
    required int productId,
    required String comment,
  }) async {
    _message = "";
    var result = await getProductsRepo.postCommentToProduct(
      token: token,
      productId: productId,
      comment: comment,
    );

    result.fold(
      (failure) {
        emit(
          OneProductFailure(
            failure.errMessage,
          ),
        );
      },
      (commentMessage) {
        _message = commentMessage["message"]!;
        emit(
          OneProductSuccessCommentAndRate(
            commentMessage["message"],
          ),
        );
      },
    );
  }

  Future<void> postRate({
    required String token,
    required int productId,
    required num rate,
  }) async {
    _message = "";
    var result = await getProductsRepo.postRateToProduct(
      token: token,
      productId: productId,
      rate: rate,
    );

    result.fold(
      (failure) {
        emit(
          OneProductFailure(
            failure.errMessage,
          ),
        );
      },
      (commentMessage) {
        _message = commentMessage["message"]!;
        emit(
          OneProductSuccessCommentAndRate(
            commentMessage["message"],
          ),
        );
      },
    );
  }
}
