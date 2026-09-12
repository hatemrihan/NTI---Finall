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
      await saveToken(response.data['accessToken']);
      log('LOGIN TOKEN EMPTY: ${token.isEmpty}');
      log('LOGIN TOKEN LENGTH: ${token.length}');
      log("response : $response");
      log('TOKEN: $token');
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

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/change-password',
        data: {
          'currentPassword': oldPassword,
          'newPassword': newPassword,
          'confirmNewPassword': confirmNewPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException catch (e) {
      log("Status Code: ${e.response?.statusCode}");
      log("Error Data: ${e.response?.data}");
      throw Exception(e.response?.data.toString());
    }
  }

  Future<void> verifyEmail({
    required String otpCode,
    required String email,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/verify-email',
        data: {'otp': otpCode, "email": email},
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }

  Future<Response> resendOtp({required String email}) async {
    final response = await dio.post(
      'https://accessories-eshop.runasp.net/api/auth/resend-otp',
      data: {'email': email},
    );
    return response;
  }

  
}
