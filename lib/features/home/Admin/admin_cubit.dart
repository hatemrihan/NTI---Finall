import 'package:final_project/features/home/Admin/admin_product_states.dart';
import 'package:final_project/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminProductStates> {
  AdminCubit() : super(AdminInitial());
  final HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource();
  final List<ProductModel> productList = [];

  Future<void> addProduct(ProductModel product) async {
    emit(AdminAddProductLoadingState());
    await homeRemoteDataSource.addProduct(product).then((_) {
      emit(AdminAddProductSuccessState(message: 'Product added successfully', product: product));
      productList.add(product);
    }).catchError((error) {
      emit(AdminAddProductFailureState(error: error.toString()));
    });
  
  }
  Future<void> updateProduct(ProductModel product) async {
    emit(AdminUpdateProductLoadingState());
    await homeRemoteDataSource.updateProduct(product).then((_) {
      emit(AdminUpdateProductSuccessState(message: 'Product updated successfully', product: product));
    }).catchError((error) {
      emit(AdminUpdateProductFailureState(error: error.toString()));
    });
  }
  Future<void> deleteProduct(String productId) async {
    emit(AdminDeleteProductLoadingState());
    await homeRemoteDataSource.deleteProduct(productId).then((_) {
      emit(AdminDeleteProductSuccessState(message: 'Product deleted successfully', productId: productId));
    }).catchError((error) {
      emit(AdminDeleteProductFailureState(error: error.toString()));
    });
  }
}
