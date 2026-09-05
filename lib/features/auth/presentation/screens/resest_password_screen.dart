import 'package:final_project/core/utils/validators.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';

import 'package:final_project/features/auth/presentation/widgets/password_text_section.dart';
import 'package:final_project/features/auth/presentation/widgets/custom_password_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController passwordCtl = TextEditingController();
  final TextEditingController confirmPasswordCtl = TextEditingController();
  bool isVisiablePassword = true;
  bool isVisiableConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                  const SizedBox(height: 24),

                  const PasswordTextSection(
                    title: "Reset Password",
                    subtitle:
                        "Please enter and confirm your new password below.",
                  ),
                  const SizedBox(height: 32),
                  CustomPasswordField(
                    controller: passwordCtl,
                    title: 'Password',
                    hintText: 'Please enter your new password',
                    validator: (password) {
                      return Validator.validatePassword(password!);
                    },
                    obscureText: isVisiablePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiablePassword = !isVisiablePassword;
                        });
                      },
                      icon: Icon(
                        isVisiablePassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.grayClr,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),

                  CustomPasswordField(
                    controller: confirmPasswordCtl,
                    title: 'Confirm Password',
                    hintText: 'Please confirm your new password',
                    obscureText: isVisiableConfirmPassword,
                    validator: (confirmPassword) {
                      return Validator.validateConfirmPassword(passwordCtl.text, confirmPassword!);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiableConfirmPassword = !isVisiableConfirmPassword;
                        });
                      },
                      icon: Icon(
                        isVisiableConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grayClr,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  CustomElevatedButton(
                    text: "Reset Password",
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    ),
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
