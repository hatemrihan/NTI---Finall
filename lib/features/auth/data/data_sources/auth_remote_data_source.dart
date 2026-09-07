import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/core/Token/token.dart';

class AuthRemoteDataSource {
  final Dio dio = Dio();

  Future<void> login({required String email, required String password}) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {"email": email, "password": password},
      );
      token = response.data['token'];
      log("response : $response");
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: {
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
        },
      );
      log('response : $response');
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }
}
