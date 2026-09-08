import 'package:final_project/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  final HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource();

  List<ProductModel> products = [];
  List categories = [];

  bool isProductsLoading = false;
  bool isCategoriesLoading = false;

  Future<void> getProducts() async {
    isProductsLoading = true;
    emit(GetProductsLoadingState());
    try {
      products = await homeRemoteDataSource.getProducts();
      isProductsLoading = false;
      emit(GetProductsSuccessState());
    } catch (error) {
      isProductsLoading = false;
      emit(GetProductsFailureState(error: error.toString()));
    }
  }

  Future<void> getCategories() async {
    isCategoriesLoading = true;
    emit(GetCategoriesLoadingState());
    try {
      categories = await homeRemoteDataSource.getCategories();
      isCategoriesLoading = false;
      emit(GetCategoriesSuccessState());
    } catch (error) {
      isCategoriesLoading = false;
      emit(GetCategoriesFailureState(error: error.toString()));
    }
  }
}
