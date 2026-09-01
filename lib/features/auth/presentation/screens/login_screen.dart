import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/features/auth/presentation/screens/signup_screen.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_button.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/features/auth/presentation/widgets/login_header_section.dart';
import 'package:final_project/features/auth/presentation/widgets/login_social_section.dart';
import 'package:final_project/widgets/or_divider.dart';
import 'package:final_project/core/helper/validators.dart';
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

  /*
curl https://accessories-eshop.runasp.net/api/auth/login \
  --request POST \
  --header 'Content-Type: application/json' \
  --data '{
  "email": "",
  "password": ""
}'
 */

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
                  SizedBox(height: 70),

                  LoginHeaderSection(
                    logo: "NOMA",
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
                    prefixIcon: Icon(Icons.key_outlined),
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
                      onPressed: () {
                        log("Forget pass pressed");
                      },
                    ),
                  ),
                  SizedBox(height: 60),
                  CustomElevatedButton(
                    text: 'Login',
                    // onPressed: () {
                    //   log('Login pressed');
                    // },
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    ),
                  ),
                  SizedBox(height: 30),
                  OrDivider(),
                  SizedBox(height: 30),
                  LoginSocialSection(),
                  SizedBox(height: 48),
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
