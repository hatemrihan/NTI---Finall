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
            emit(LoginFailureState());
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
          },
          (value) {
            emit(SignUpSuccessState());
          },
        );
  }
}