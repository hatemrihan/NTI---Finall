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

  Future<void> addProduct(ProductModel product) async {
    try {
      await dio.post(
        "https://accessories-eshop.runasp.net/api/products",

        options: Options(
          headers: {
            'content-type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: product.toJson(),
      );
    } on DioException catch (e) {
      log('Error in addProductttttttttt: ${e.response}');
      
      log('Errorrrrrrr: ${e.response?.data}');

      log('Error in addProduct: ${e.message}');
      throw Exception(e.response?.data?.toString() ?? e.message);
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await dio.put(
        "https://accessories-eshop.runasp.net/api/products/${product.id}",
        data: product.toJson(),
      );
      log('Product updated successfully: ${product.toJson()}');
    } on DioException catch (e) {
      log('Error updating product: ${product.id}');
      log('Error in updateProduct: $e');
      log('Errorrrrrrr: ${e.response?.data}');
      log('Error in updateProduct: ${e.message}');
      throw Exception(e.response?.data?.toString() ?? e.message);
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await dio.delete(
        "https://accessories-eshop.runasp.net/api/products/$productId",
        
        options: Options(
          headers: {
            'Accept': 'application/json',
          
          },
        ),
        
      );
      log('Product deleted successfully: $productId');

      
    } on DioException catch (e) {
      log('Error in deleteProduct: $e');
      throw Exception(e.response?.data?.toString() ?? e.message);
    }
  }
}
