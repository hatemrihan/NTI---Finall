import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_states.dart';
import 'package:final_project/features/auth/presentation/screens/signup_screen.dart';
import 'package:final_project/core/widgets/custom_text_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/features/auth/presentation/widgets/login_header_section.dart';
import 'package:final_project/features/auth/presentation/widgets/login_social_section.dart';
import 'package:final_project/features/auth/presentation/widgets/or_divider.dart';
import 'package:final_project/core/utils/validators.dart';
import 'package:final_project/features/auth/presentation/screens/forgot%20_password_screen.dart';
import 'package:final_project/features/navigation/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiable = true;
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  @override
  void dispose() {
    super.dispose();
    emailCtl.dispose();
    passwordCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: myKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoginHeaderSection(
                    logo: "assets/images/logo.png",
                    title: "Welcome Back",
                    subTitle: "Enter your details to access your account",
                  ),
                  SizedBox(height: 32),

                  CustomTextField(
                    prefixIcon: Icon(Icons.mail_outline),
                    controller: emailCtl,
                    title: 'Email Address',
                    hintText: 'Enter your email',
                    validator: (email) {
                      return Validator.validateEmail(email!);
                    },
                  ),
                  SizedBox(height: 16),

                  CustomTextField(
                    prefixIcon: Icon(Icons.lock_outline),
                    controller: passwordCtl,
                    title: 'Password',
                    hintText: 'Please enter your password',
                    obscureText: isVisiable,
                    validator: (password) {
                      return Validator.validatePassword(password!);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiable = !isVisiable;
                        });
                      },
                      icon: Icon(
                        isVisiable ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.grayClr,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      text: 'Forgot Password?',
                      textClr: AppColors.primaryClr,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  BlocConsumer<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return CustomElevatedButton(
                          text: 'Login',
                          onPressed: () async {
                            if (myKey.currentState!.validate()) {
                              await context.read<AuthCubit>().login(
                                email: emailCtl.text,
                                password: passwordCtl.text,
                              );
                            }
                          },
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationBarScreen(),
                          ),
                        );
                      } else if (state is LoginFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed. Please try again.'),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 32),
                  OrDivider(),
                  SizedBox(height: 32),
                  LoginSocialSection(),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppStyles.style14Regular.copyWith(
                          color: AppColors.grayClr,
                        ),
                      ),
                      CustomTextButton(
                        text: 'Sign Up',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AuthCubit(),
                              child: SignupScreen(),
                            ),
                          ),
                        ),
                        textClr: AppColors.primaryClr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
