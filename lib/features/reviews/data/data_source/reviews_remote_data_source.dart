import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/core/Token/token.dart';

class ReviewRemoteDataSource {
  final Dio dio = Dio();
  Future<String> addReview({required String productId,required int rating, required String comment, }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/reviews/$productId',
        data: {
          'rating': rating,
          'comment': comment,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      log('STATUS: ${response.statusCode}');
      log('DATA: ${response.data}');
      return "success";
    } on DioException catch (e) {
      log('STATUS: ${e.response?.statusCode}');
      log('DATA: ${e.response?.data}');
      if (e.response?.data.toString().contains('UserAlreadyReviewed') ?? false) {
      return 'alreadyReviewed';
    }
      return "failure";
    }
  }



  Future<Map<String, dynamic>> getReviews({
    required String productId,
  }) async {
    try {
      log('get reviews');
      final response = await dio.get(
        'https://accessories-eshop.runasp.net/api/reviews/$productId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      log(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      log('STATUS: ${e.response?.statusCode}');
      log('DATA: ${e.response?.data}');
      throw Exception(e.response?.data);
    }
  }
}