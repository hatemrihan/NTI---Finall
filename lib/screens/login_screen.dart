import 'dart:developer';
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/screens/signup_screen.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_button.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/login_header_section.dart';
import 'package:final_project/widgets/login_social_section.dart';
import 'package:final_project/widgets/or_divider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                  title: 'Email Address',
                  hintText: 'Enter your email',
                ),
                SizedBox(height: 16),

                CustomTextField(
                  prefixIcon: Icon(Icons.key_outlined),
                  title: 'Password',
                  hintText: 'Please enter your password',
                  obscureText: isVisiable,
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
                  onPressed: () {
                    log('Login pressed');
                  },
                  // onPressed: () => Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // ),
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
                      style: AppStyles.style14.copyWith(
                        color: AppColors.grayClr,
                      ),
                    ),
                    CustomTextButton(
                      text: 'Sign Up',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
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
    );
  }
}
