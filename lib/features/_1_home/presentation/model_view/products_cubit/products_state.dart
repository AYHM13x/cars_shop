part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccessGetAllProducts extends ProductsState {
  final AllProducts allProducts;

  ProductsSuccessGetAllProducts(this.allProducts);
}

class ProductsSuccessGetFilteredProducts extends ProductsState {
  final AllProducts filteredProducts;

  ProductsSuccessGetFilteredProducts(this.filteredProducts);
}

class ProductsFailure extends ProductsState {
  final String errmessage;

  ProductsFailure(this.errmessage);
}
