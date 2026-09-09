import 'dart:developer';

import 'package:final_project/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:final_project/features/cart/presentation/cubits/cart_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRemoteDataSource cartRemoteDataSource = CartRemoteDataSource();
  CartCubit() : super(getcartIntionslate());

  Future<void> getcart() async {
    if (isClosed) return;
    emit(getcartloding());
    await cartRemoteDataSource.getcart().then(
      onError: (error) {
        log('Error:$error');
        if (!isClosed) emit(getcartempty());
      },
      (val) {
        log(val.toString());
        if (!isClosed) emit(getcartscusses(productscart: val));
      },
    );
  }

  Future<dynamic> removeCart(cartId) async {
    if (isClosed) return;
    emit(removeCartloading());
    try {
      final val = await cartRemoteDataSource.removeCart(cartId);
      if (!isClosed) emit(removeCartsuccess(removeProductcart: []));
      getcart();
    } catch (error) {
      log('Error: $error');
      if (!isClosed) emit(removeCartfialure());
      getcart();
    }
  }
}
