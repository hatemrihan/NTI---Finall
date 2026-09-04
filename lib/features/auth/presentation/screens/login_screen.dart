import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/auth/presentation/screens/signup_screen.dart';
import 'package:final_project/core/widgets/custom_text_button.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/features/auth/presentation/widgets/login_header_section.dart';
import 'package:final_project/features/auth/presentation/widgets/login_social_section.dart';
import 'package:final_project/features/auth/presentation/widgets/or_divider.dart';
import 'package:final_project/core/utils/validators.dart';
import 'package:final_project/features/auth/presentation/screens/forgot%20_password_screen.dart';
import 'package:final_project/screens/bottom_nav_bar_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';

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

  Future<void> login() async {
    final Dio dio = Dio();
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {
          {"email": emailCtl.text, "password": passwordCtl.text},
        },
      );
      setState(() {});
    } on DioException catch (e) {
      log('Error : ${e.response!.data['errors']}');
      log('Status Code : ${e.response!.data['statusCode']}');
      log('Message : ${e.response!.data['message']}');
    }
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
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  CustomElevatedButton(
                    text: 'Login',
                    // onPressed: () {
                    //   log('Login pressed');
                    // },
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
                    ),
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
                            builder: (context) => SignupScreen(),
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
