import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/customArrowBack.dart';
import 'package:final_project/widgets/custom_arrow_back.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

// Custom files from Authentications folder
import 'package:final_project/screens/Authentications/SharableCode/auth_scaffold.dart';
import 'package:final_project/screens/Authentications/SharableCode/auth_header.dart';
import 'package:final_project/screens/Authentications/ResestPassword.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom file: auth_scaffold.dart
    return AuthScaffold(
      scrollable: false,
      children: [
        // ── Back button
        const Customarrowback(),
        const SizedBox(height: 32),

        // ── Lock icon
        const Center(
          child: Icon(
            Icons.lock_outline,
            size: 48,
            color: AppColors.primaryClr,
          ),
        ),
        const SizedBox(height: 24),

        // Custom file: auth_header.dart
        const AuthHeader(
          title: "Forgot Password?",
          subtitle:
              "Enter your email address below and we'll send you a secure link to reset your password.",
        ),
        const SizedBox(height: 28),

        // ── Email field
        const CustomTextField(
          title: "Email Address",
          hintText: "sophia@domain.com",
          prefixIcon: Icon(
            Icons.email_outlined,
            color: AppColors.grayClr,
            size: 20,
          ),
        ),
        const SizedBox(height: 28),

        // ── Send Reset Link button
        CustomElevatedButton(
          text: "Send Reset Link",
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ResetPasswordScreen(),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // ── Back to Sign In
        Center(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Back to Sign In",
              style: AppStyles.style14Bold.copyWith(
                fontFamily: "Manrope",
                color: AppColors.textClr,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
