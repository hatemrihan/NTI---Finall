import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:final_project/core/Token/token.dart';

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
        options: Options(headers: {"Authorization": "Bearer $token"}),
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
