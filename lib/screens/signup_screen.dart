import 'dart:developer';

import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_button.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisiable = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                  style: AppStyles.style14.copyWith(color: AppColors.grayClr),
                ),
                SizedBox(height: 24),
                CustomTextField(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  title: 'Full Name',
                  hintText: 'Enter your name',
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 16),

                CustomTextField(
                  prefixIcon: Icon(Icons.key_outlined),
                  title: 'Confirm Password',
                  hintText: 'Confirm your password',
                  obscureText: isVisiable,
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
                            style: AppStyles.style14.copyWith(
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
                            style: AppStyles.style14.copyWith(
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
                  onPressed: () {
                    log('Signup pressed');
                  },
                  // onPressed: () => Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // ),
                ),
                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: AppStyles.style14.copyWith(
                        color: AppColors.grayClr,
                      ),
                    ),
                    CustomTextButton(
                      text: 'Login',
                      onPressed: () => Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
