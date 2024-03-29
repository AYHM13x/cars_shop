import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/all_products/all_products.dart';
import '../../../data/all_products/product.dart';
import '../../../data/repo/get_data_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.getProductsRepo) : super(ProductsInitial());

  final GetProductsRepo getProductsRepo;
  List<ProductAllProducts> _productsAllProducts = [];
  List<ProductAllProducts> _productsFilteredProducts = [];
  String _token = "";
  String _message = "";

  List<ProductAllProducts> getAllProductsList() => _productsAllProducts;

  List<ProductAllProducts> getFilteredProducts() => _productsFilteredProducts;

  String getToken() => _token;

  String getMessage() => _message;

  void initData() {
    _productsAllProducts = [];
    _message = "";
    _token = "";
  }

  Future<void> getAllProducts({
    required String token,
  }) async {
    initData();
    _token = token;
    emit(ProductsLoading());
    var result = await getProductsRepo.getAllProducts(
      token: token,
    );

    result.fold(
      (failure) {
        emit(
          ProductsFailure(
            failure.errMessage,
          ),
        );
      },
      (allproducts) {
        _productsAllProducts = allproducts.data!;
        _message = allproducts.message!;
        emit(
          ProductsSuccessGetAllProducts(
            allproducts,
          ),
        );
      },
    );
  }

  Future<void> postFilteredProducts({
    required String token,
    required String title,
    required num rate,
  }) async {
    _token = token;
    emit(ProductsLoading());
    _productsFilteredProducts = [];
    _message = "";
    var result = await getProductsRepo.postFilteredProducts(
      token: token,
      title: title,
      rate: rate,
    );

    result.fold(
      (failure) {
        emit(
          ProductsFailure(
            failure.errMessage,
          ),
        );
      },
      (filteredProducts) {
        _productsFilteredProducts = filteredProducts.data!;
        _message = filteredProducts.message!;
        emit(
          ProductsSuccessGetFilteredProducts(
            filteredProducts.data as List<ProductAllProducts>,
          ),
        );
      },
    );
  }

  searchProduct(String search) {
    emit(ProductsLoading());
    _productsFilteredProducts = _productsAllProducts
        .where((s) => s.title!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    emit(ProductsSuccessGetFilteredProducts(_productsFilteredProducts));
  }
}
