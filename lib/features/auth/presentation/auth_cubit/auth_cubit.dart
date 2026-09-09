import 'dart:developer';

import 'package:final_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    await authRemoteDataSource
        .login(email: email, password: password)
        .then(
          onError: (error) {
            //
            final errorMessage = error.toString();
            if (errorMessage ==
                "Exception: {statusCode: 400, message: One or more errors occurred!, errors: {email: [Email not verified, please verify your email first.]}}") {
              log("Navigated to Verify Email");
              emit(UnverifiedAccountState(email));
            }
            //
            else {
              emit(LoginFailureState(error: errorMessage));
              log(errorMessage);
            }
          },
          (value) {
            emit(LoginSuccessState());
          },
        );
  }

  Future<void> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(SignUpLoadingState());
    await authRemoteDataSource
        .signup(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        )
        .then(
          onError: (error) {
            emit(SignUpFailureState());
            log(error.toString());
          },
          (value) {
            emit(SignUpSuccessState());
          },
        );
  }

  ////
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    try {
      await authRemoteDataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );
      emit(ChangePasswordSuccessState());
    } catch (error) {
      emit(ChangePasswordFailureState(error: error.toString()));
    }
  }

  //
  Future<void> verifyEmail({
    required String otpCode,
    required String email,
  }) async {
    emit(VerifyEmailLoadingState());
    try {
      await authRemoteDataSource.verifyEmail(otpCode: otpCode, email: email);
      emit(VerifyEmailSuccessState());
    } catch (error) {
      emit(VerifyEmailFailureState(error: error.toString()));
    }
  }

  //
  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoadingState());
    try {
      await authRemoteDataSource.resendOtp(email: email);
      emit(ResendOtpSuccessState());
    } catch (e) {
      emit(ResendOtpFailureState(e.toString()));
    }
  }
}
