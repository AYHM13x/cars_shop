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
  int _chossedRateIndex = -1;

  void initVars() {
    _message = "";
    _token = "";
    _chossedRateIndex = -1;
  }

  String getMesage() => _message;

  String getToken() => _token;

  void setChossedRateIndex(int index) {
    _chossedRateIndex = index;
  }

  int getChossedRateIndex() => _chossedRateIndex;

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
}
