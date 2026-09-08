import 'dart:developer';

import 'package:dio/dio.dart';

class CartRemoteDataSource {
  final Dio dio = Dio();

  Future<dynamic> getcart() async {
    try {
      final Response response = await dio.get(
        'https://accessories-eshop.runasp.net/api/cart',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhMDY5MmE4NS00OGQyLTQ2NzUtY2MwMC0wOGRmMDY5Y2ExNDMiLCJqdGkiOiI4ZjczZmQ0My0zOGE2LTRkYWUtODdjMi1lZjIwOWY1OGZjNWIiLCJlbWFpbCI6ImFsc2FpZGE5NThAZ21haWwuY29tIiwibmFtZSI6IkFobWVkIEVsaGFkZGFkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MDA0NjEzLCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.Or2dv76lMZylvgHVre71vebdKctRwka917K3OrWpMVs',
          },
        ),
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

        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhMDY5MmE4NS00OGQyLTQ2NzUtY2MwMC0wOGRmMDY5Y2ExNDMiLCJqdGkiOiI4ZjczZmQ0My0zOGE2LTRkYWUtODdjMi1lZjIwOWY1OGZjNWIiLCJlbWFpbCI6ImFsc2FpZGE5NThAZ21haWwuY29tIiwibmFtZSI6IkFobWVkIEVsaGFkZGFkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MDA0NjEzLCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.Or2dv76lMZylvgHVre71vebdKctRwka917K3OrWpMVs',
          },
        ),
      );
    } on DioException catch (e) {
      log('response: ${e.response?.data ?? 'error'}');
    }
  }
}
