import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/custom_appBar_widget.dart';
import 'package:final_project/widgets/password_strengthIndicatorBar.dart';
import 'package:final_project/core/helper/validators.dart';
import 'package:flutter/material.dart';

class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({super.key});

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  bool isVisiable = true;
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController currentPasswordCtl = TextEditingController();
  final TextEditingController newPasswordCtl = TextEditingController();
  final TextEditingController confirmPasswordCtl = TextEditingController();

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
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),

                // Current Password Field
                CustomTextField(
                  controller: currentPasswordCtl,
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
                  validator: (currentPassword) {
                    return Validator.validatePassword(currentPassword!);
                  },
                ),

                const SizedBox(height: 20),

                // New Password Field
                CustomTextField(
                  controller: newPasswordCtl,
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
                  validator: (newPassword) {
                    return Validator.validatePassword(newPassword!);
                  },
                ),

                SizedBox(height: 12),

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

                SizedBox(height: 8),

                // Password Strength Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Password Strength:",
                      style: AppStyles.style14Regular.copyWith(
                        color: AppColors.grayClr,
                      ),
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
                  controller: confirmPasswordCtl,
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
                  validator: (confirmPassword) {
                    return Validator.validatePassword(confirmPassword!);
                  },
                ),

                SizedBox(height: 36),

                CustomElevatedButton(text: "Update Password", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
