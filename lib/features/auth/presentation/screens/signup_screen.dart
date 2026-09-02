import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/screens/emailVerification_screen.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_button.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/core/helper/validators.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController firstNameCtl = TextEditingController();
  final TextEditingController lastNameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  final TextEditingController confirmPasswordCtl = TextEditingController();
  bool isVisiable = true;
  bool isChecked = false;

  Future<void> signUp() async {
    final Dio dio = Dio();
    try {
      await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: {
          "email": emailCtl.text,
          "password": passwordCtl.text,
          "firstName": firstNameCtl.text,
          "lastName": lastNameCtl.text,
        },
      );
      setState(() {});
    } on DioException catch (e) {
      log('Status Code : ${e.response!.data['statusCode']}');
      log('Message : ${e.response!.data['message']}');
      log('Error : ${e.response!.data['errors']}');
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    padding: EdgeInsets.zero,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.bottomBackgroundClr,
                      side: BorderSide(color: AppColors.grayClr),
                    ),
                    icon: const Icon(Icons.arrow_back, size: 20),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Create Account',
                    style: AppStyles.style28ExtraBold.copyWith(
                      color: AppColors.textClr,
                      fontFamily: "Manrope",
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Join NOMA today for exclusive collections.',
                    style: AppStyles.style14Regular.copyWith(
                      color: AppColors.grayClr,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          controller: firstNameCtl,
                          title: 'First Name',
                          hintText: 'Your first name',
                          validator: (firstName) {
                            return Validator.validateUserName(firstName!);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          controller: lastNameCtl,
                          title: 'Last Name',
                          hintText: 'Your last name',
                          validator: (lastName) {
                            return Validator.validateUserName(lastName!);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
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
                    validator: (password) {
                      return Validator.validatePassword(password!);
                    },
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
                  SizedBox(height: 16),

                  CustomTextField(
                    prefixIcon: Icon(Icons.key_outlined),
                    controller: confirmPasswordCtl,
                    title: 'Confirm Password',
                    hintText: 'Confirm your password',
                    obscureText: isVisiable,
                    validator: (confirmPassword) {
                      return Validator.validatePassword(confirmPassword!);
                    },
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity(
                          horizontal: -4,
                          vertical: -2,
                        ),
                        activeColor: AppColors.primaryClr,
                        value: isChecked,
                        onChanged: (newVal) {
                          log(newVal.toString());
                          isChecked = newVal!;
                          setState(() {});
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: AppStyles.style14Regular.copyWith(
                                color: AppColors.grayClr,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: AppStyles.style14Bold.copyWith(
                                color: AppColors.textClr,
                              ),
                            ),
                            TextSpan(
                              text: ' & ',
                              style: AppStyles.style14Regular.copyWith(
                                color: AppColors.grayClr,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: AppStyles.style14Bold.copyWith(
                                color: AppColors.textClr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  CustomElevatedButton(
                    text: 'Create Account',
                    // onPressed: () {
                    //   log("Create Account");

                    // },
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailverificationScreen(),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppStyles.style14Regular.copyWith(
                          color: AppColors.grayClr,
                        ),
                      ),
                      CustomTextButton(
                        text: 'Login',
                        onPressed: () => Navigator.pop(context),
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
