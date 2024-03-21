import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/one_product/one_product.dart';
import '../../../data/repo/get_data_repo.dart';

part 'one_product_state.dart';

class OneProductCubit extends Cubit<OneProductState> {
  OneProductCubit(this.getProductsRepo) : super(OneProductInitial());

  final GetProductsRepo getProductsRepo;
  String _message = "";
  String _token = "";
  OneProduct currentProduct = OneProduct();
  int _chossedRateIndex = -1;
  int _selectedProductIndex = -1;
  bool _isLoadingComment = false;
  bool _isLoadingRate = false;

  void initVars() {
    _message = "";
    _token = "";
    _chossedRateIndex = -1;
    _isLoadingComment = false;
    _isLoadingRate = false;
  }

  String getMesage() => _message;

  String getToken() => _token;

  void setChossedRateIndex(int index) {
    _chossedRateIndex = index;
  }

  int getChossedRateIndex() => _chossedRateIndex;

  void setSelectedProductIndex(int index) {
    _selectedProductIndex = index;
  }

  int getSelectedProductIndex() => _selectedProductIndex;

  void setIsLoadingComment(bool isloading) {
    _isLoadingComment = isloading;
  }

  bool getIsLoadingComment() => _isLoadingComment;

  void setIsLoadingRate(bool isloading) {
    _isLoadingRate = isloading;
  }

  bool getIsLoadingRate() => _isLoadingRate;

  Future<void> getOneProduct({
    required String token,
    required int productId,
  }) async {
    initVars();
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
      (oneProduct) {
        currentProduct = oneProduct;
        emit(
          OneProductSuccess(
            oneProduct,
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
    emit(OneProductLoading());
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
          OneProductSuccessComment(
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
    emit(OneProductLoading());
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
          OneProductSuccessRate(
            commentMessage["message"],
          ),
        );
      },
    );
  }
}
