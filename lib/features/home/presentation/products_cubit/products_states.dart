import 'package:final_project/features/home/data/models/product_model.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

// Products States
class GetProductsLoadingState extends ProductsState {}

class GetProductsSuccessState extends ProductsState {
  final List<ProductModel> products;
  GetProductsSuccessState({required this.products});
}

class GetProductsFailureState extends ProductsState {
  final String? error;
  GetProductsFailureState({this.error});
}

class SearchProductsLoadingState extends ProductsState {}

class SearchProductsSuccessState extends ProductsState {
  final List<ProductModel> products;

  SearchProductsSuccessState({required this.products});
}

class SearchProductsFailureState extends ProductsState {
  final String? error;

  SearchProductsFailureState({this.error});
}

// Categories States
class GetCategoriesLoadingState extends ProductsState {}

class GetCategoriesSuccessState extends ProductsState {
}

class GetCategoriesFailureState extends ProductsState {
  final String? error;
  GetCategoriesFailureState({this.error});
}
class AddProductLoadingState extends ProductsState {}
class AddProductSuccessState extends ProductsState {
  static const String message = "Product added successfully";
}
class AddProductFailureState extends ProductsState {
  final String? error;
  AddProductFailureState({this.error});
}

class addToCartloding extends ProductsState {}

class addToCartSuccess extends ProductsState {}

class addToCartFailure extends ProductsState {}