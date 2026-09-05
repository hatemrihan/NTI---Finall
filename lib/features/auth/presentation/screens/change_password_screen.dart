import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/core/widgets/custom_text_field.dart';
import 'package:final_project/features/auth/presentation/widgets/custom_password_field.dart';
import 'package:final_project/widgets/custom_appBar_widget.dart';
import 'package:final_project/core/utils/validators.dart';
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
  final TextEditingController confirmNewPasswordCtl = TextEditingController();
  bool isVisiableNewPassword = true;
  bool isVisiableConfirmNewPassword = true;

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
          padding: const EdgeInsets.all(24),
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                CustomTextField(
                  title: "Current Password",
                  hintText: "Enter your current password",
                ),

                const SizedBox(height: 20),
                CustomPasswordField(
                  controller: newPasswordCtl,
                  title: 'New Password',
                  hintText: 'Enter your new password',
                  validator: (newPassword) {
                    return Validator.validatePassword(newPassword!);
                  },
                  obscureText: isVisiableNewPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisiableNewPassword = !isVisiableNewPassword;
                      });
                    },
                    icon: Icon(
                      isVisiableNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.grayClr,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                CustomPasswordField(
                  controller: confirmNewPasswordCtl,
                  title: 'Confirm New Password',
                  hintText: 'Re-enter your new password',
                  obscureText: isVisiableConfirmNewPassword,
                  validator: (confirmNewPassword) {
                    return Validator.validateConfirmPassword(
                      newPasswordCtl.text,
                      confirmNewPassword!,
                    );
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisiableConfirmNewPassword =
                            !isVisiableConfirmNewPassword;
                      });
                    },
                    icon: Icon(
                      isVisiableConfirmNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.grayClr,
                    ),
                  ),
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
