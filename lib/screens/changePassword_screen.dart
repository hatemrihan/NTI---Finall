import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/custonmAppBar_widget.dart';
import 'package:final_project/widgets/passwordStrengthIndicatorBar.dart';
import 'package:flutter/material.dart';

class ChangepasswordScreen extends StatelessWidget {
  const ChangepasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: CustomAppbarWidget(
        title: "Change Password",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Current Password Field
              CustomTextField(
                title: "Current Password",
                hintText: "Your old assword",
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.grayClr,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // New Password Field
              CustomTextField(
                title: "New Password",
                hintText: "Enter new password",
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.grayClr,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Password Strength Indicator Bar
              Row(
                children: [
                  Passwordindicatorbar(),
                  SizedBox(width: 6),
                  Passwordindicatorbar(),
                  SizedBox(width: 6),
                  Passwordindicatorbar(),
                  SizedBox(width: 6),
                  Passwordindicatorbar(),
                ],
              ),

              const SizedBox(height: 8),

              // Password Strength Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password Strength:",
                    style: AppStyles.style14.copyWith(color: AppColors.grayClr),
                  ),
                  const Text(
                    "Medium",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC88A68),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Confirm New Password Field
              CustomTextField(
                title: "Confirm New Password",
                hintText: "Re-enter new password",
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.grayClr,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // Update Password Button
              CustomElevatedButton(text: "Update Password", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
