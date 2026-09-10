import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project/core/Token/token.dart';

class CartRemoteDataSource {
  final Dio dio = Dio();

  Future<dynamic> getcart() async {
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/cart',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data['cartItems'];
    } on DioException catch (e) {
      log('response: ${e.response?.data ?? 'error'}');
      throw Exception('Error000');
    }
  }

  Future<dynamic> removeCart(cartId) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items/decrement',
        data: {"itemId": cartId, "quantity": 1},

        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioException catch (e) {
      log('response: ${e.response?.data ?? 'error'}');
    }
  }
}
