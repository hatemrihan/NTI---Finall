import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:final_project/features/auth/presentation/widgets/password_text_section.dart';
import 'package:final_project/features/auth/presentation/screens/resest_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> myKey = GlobalKey();

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
                  const SizedBox(height: 32),

                  const Center(
                    child: Icon(
                      Icons.lock_outline,
                      size: 50,
                      color: AppColors.primaryClr,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Custom file: forget_password_section.dart
                  const PasswordTextSection(
                    title: "Forgot Password?",
                    subtitle:
                        "Enter your email address below and we'll send you a secure link to reset your password.",
                  ),
                  const SizedBox(height: 32),

                  const CustomTextField(
                    title: "Email Address",
                    hintText: "Enter your email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.grayClr,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 32),

                  CustomElevatedButton(
                    text: "Send Reset Link",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Back to Sign In
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Back to Sign In",
                        style: AppStyles.style14SemiBold.copyWith(
                          fontFamily: "Manrope",
                          color: AppColors.textClr,
                        ),
                      ),
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
