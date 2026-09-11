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
    if (isClosed) return;
    emit(GetProductsLoadingState());
    try {
      products = await homeRemoteDataSource.getProducts();
      isProductsLoading = false;
      emit(GetProductsSuccessState(products: products));
    } catch (error) {
      isProductsLoading = false;
      if (!isClosed) emit(GetProductsFailureState(error: error.toString()));
    }
  }

  Future<void> searchProducts(String query) async {
    final normalizedQuery = query.trim();
    if (normalizedQuery.isEmpty) {
      await getProducts();
      return;
    }

    isProductsLoading = true;
    if (isClosed) return;
    emit(SearchProductsLoadingState());
    try {
      products = await homeRemoteDataSource.searchProducts(normalizedQuery);
      isProductsLoading = false;
      if (!isClosed) {
        emit(SearchProductsSuccessState(products: products));
      }
    } catch (error) {
      isProductsLoading = false;
      if (!isClosed) {
        emit(SearchProductsFailureState(error: error.toString()));
      }
    }
  }

  Future<void> getCategories() async {
    isCategoriesLoading = true;
    if (isClosed) return;
    emit(GetCategoriesLoadingState());
    try {
      categories = await homeRemoteDataSource.getCategories();
      isCategoriesLoading = false;
      if (!isClosed) emit(GetCategoriesSuccessState());
    } catch (error) {
      isCategoriesLoading = false;
      if (!isClosed) emit(GetCategoriesFailureState(error: error.toString()));
    }
  }

  Future<void> addToCart(productId) async {
    if (isClosed) return;
    emit(addToCartloding());
    try {
      await homeRemoteDataSource.addToCart(productId);
      if (!isClosed) emit(addToCartSuccess());
    } catch (error) {
      if (!isClosed) emit(addToCartFailure());
    }
  }

  Future<void> deleteProduct({required String productId}) async {
    emit(DeleteProductLoadingState(productId));

    try {
      await homeRemoteDataSource.deleteProduct(productId);

      emit(DeleteProductSuccessState());

      await getProducts();
    } catch (error) {
      emit(DeleteProductFailureState(error.toString()));
    }
  }
}
