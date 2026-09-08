abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

// Products States
class GetProductsLoadingState extends ProductsState {}

class GetProductsSuccessState extends ProductsState {}

class GetProductsFailureState extends ProductsState {
  final String? error;
  GetProductsFailureState({this.error});
}

// Categories States
class GetCategoriesLoadingState extends ProductsState {}

class GetCategoriesSuccessState extends ProductsState {}

class GetCategoriesFailureState extends ProductsState {
  final String? error;
  GetCategoriesFailureState({this.error});
}
