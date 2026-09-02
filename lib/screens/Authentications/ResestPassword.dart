import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/widgets/custom_arrow_back.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';

// Custom files from Authentications folder
import 'package:final_project/screens/Authentications/SharableCode/auth_scaffold.dart';
import 'package:final_project/screens/Authentications/SharableCode/auth_header.dart';
import 'package:final_project/screens/Authentications/SharableCode/custom_password_field.dart';
import 'package:final_project/screens/Authentications/SharableCode/password_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    // Custom file: auth_scaffold.dart
    return AuthScaffold(
      scrollable: false,
      children: [
        // ── Back button
        const customArrowBack(),
        const SizedBox(height: 16),

        // Custom file: auth_header.dart
        const AuthHeader(
          title: "Reset Password",
          subtitle: "Please enter and confirm your new password below.",
        ),
        const SizedBox(height: 20),

        // Custom file: custom_password_field.dart
        CustomPasswordField(
          label: "New Password",
          hint: "nomaSovereign2026",
          obscure: _obscureNew,
          onToggle: () => setState(() => _obscureNew = !_obscureNew),
        ),

        // Custom file: password_bar.dart
        const PasswordBar(
          filledCount: 4,
          label: "Excellent password",
          color: Color(0xFFC88A68),
        ),
        const SizedBox(height: 16),

        // Custom file: custom_password_field.dart
        CustomPasswordField(
          label: "Confirm New Password",
          hint: "nomaSovereign2026",
          obscure: _obscureConfirm,
          onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
        ),
        const SizedBox(height: 28),

        // ── Reset Password button
        CustomElevatedButton(
          text: "Reset Password",
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          ),
        ),
      ],
    );
  }
}
