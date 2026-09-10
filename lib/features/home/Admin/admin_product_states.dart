import 'package:final_project/features/home/data/models/product_model.dart';

class AdminProductStates {
}
class AdminInitial extends AdminProductStates {}
class AdminLoadingState extends AdminProductStates {}
class AdminSuccessState extends AdminProductStates {
  final String message;
  AdminSuccessState({required this.message});
}
class AdminFailureState extends AdminProductStates {
  final String error;
  AdminFailureState({required this.error});
}
class AdminAddProductLoadingState extends AdminProductStates {}
class AdminAddProductSuccessState extends AdminProductStates {
  final ProductModel product;
  final String message;
  AdminAddProductSuccessState({required this.product, required this.message});
}
class AdminAddProductFailureState extends AdminProductStates {
  final String error;
  AdminAddProductFailureState({required this.error});
}
class AdminUpdateProductLoadingState extends AdminProductStates {}
class AdminUpdateProductSuccessState extends AdminProductStates {
  final ProductModel product;
  final String message;
  AdminUpdateProductSuccessState({required this.product, required this.message});
}
class AdminUpdateProductFailureState extends AdminProductStates {
  final String error;
  AdminUpdateProductFailureState({required this.error});
}
class AdminDeleteProductLoadingState extends AdminProductStates {}
class AdminDeleteProductSuccessState extends AdminProductStates { 
  final String productId;
  final String message;
  AdminDeleteProductSuccessState({required this.message, required this.productId});
}
class AdminDeleteProductFailureState extends AdminProductStates {
  final String error;
  AdminDeleteProductFailureState({required this.error});
}
