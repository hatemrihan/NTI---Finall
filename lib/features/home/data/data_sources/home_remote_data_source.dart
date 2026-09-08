import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/features/home/data/models/product_model.dart';

class HomeRemoteDataSource {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    try {
      log(" get products");
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/products",
      );
      List<ProductModel> products = [];
      for (var element in response.data['items']) {
        final ProductModel model = ProductModel.fromJson(element);
        products.add(model);
      }
      log(products.toString());
      return products;
    } on DioException catch (e) {
      log('Error in getProducts: $e');
      throw Exception(e.response?.data?.toString() ?? e.message);
    }
  }

  Future<List<dynamic>> getCategories() async {
    try {
      final Response response = await dio.get(
        "https://accessories-eshop.runasp.net/api/categories",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3ZjgyYWJjNS1hYWJjLTQ2MTEtMzVhYy0wOGRmMGMzZjg1NmQiLCJqdGkiOiJiM2E4NzRkNi0xODk3LTRiNmQtOWVlNy0yN2E1YjM1Mzk5NWQiLCJlbWFpbCI6Im1vc3RhZmFzYWFkaGFmZXo3QGdtYWlsLmNvbSIsIm5hbWUiOiJzdHJpbmcgc3RyaW5nIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg4OTQ5MjgzLCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.an0qG510_S2a07twkgygxDy3Mnw-fokLTM8deKEWTao",
          },
        ),
      );
      List<dynamic> categories = response.data["categories"] ?? [];
      log(categories.toString());
      return categories;
    } on DioException catch (e) {
      log('Error in getCategories: $e');
      throw Exception(e.response?.data?.toString() ?? e.message);
    }
  }

  Future<void> addToCart(productId) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/cart/items',
        data: {'productId': productId, 'quantity': 1},
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhMDY5MmE4NS00OGQyLTQ2NzUtY2MwMC0wOGRmMDY5Y2ExNDMiLCJqdGkiOiI4ZjczZmQ0My0zOGE2LTRkYWUtODdjMi1lZjIwOWY1OGZjNWIiLCJlbWFpbCI6ImFsc2FpZGE5NThAZ21haWwuY29tIiwibmFtZSI6IkFobWVkIEVsaGFkZGFkIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzg5MDA0NjEzLCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.Or2dv76lMZylvgHVre71vebdKctRwka917K3OrWpMVs',
          },
        ),
      );
    } on DioException catch (e) {
      log('Error in addToCart: $e');
      throw Exception(e.response?.data?.toString() ?? e.message);
    }
  }
}
