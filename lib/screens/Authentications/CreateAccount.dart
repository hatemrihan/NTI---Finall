import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/widgets/custom_arrow_back.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

// Custom files from Authentications folder
import 'package:final_project/screens/Authentications/SharableCode/auth_scaffold.dart';
import 'package:final_project/screens/Authentications/SharableCode/auth_header.dart';
import 'package:final_project/screens/Authentications/SharableCode/custom_password_field.dart';
import 'package:final_project/screens/Authentications/SharableCode/password_bar.dart';
import 'package:final_project/screens/Authentications/EmailVerification.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _hiddenPassword = true;
  bool _obscureConfirm = true;
  bool _agreeToTerms = false;

  final _namectrl = TextEditingController();
  final _emailctrl = TextEditingController();
  final _passwordctrl = TextEditingController();
  final _confirmctrl = TextEditingController();

  @override
  void dispose() {
    _namectrl.dispose();
    _emailctrl.dispose();
    _passwordctrl.dispose();
    _confirmctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Custom file: auth_scaffold.dart
    return AuthScaffold(
      scrollable: true,
      children: [
        // ── Back button
        const customArrowBack(),
        const SizedBox(height: 16),

        // Custom file: auth_header.dart
        const AuthHeader(
          title: "Create Account",
          subtitle: "Join NOMA today for exclusive collections.",
        ),
        const SizedBox(height: 24),

        // ── Full Name
        CustomTextField(
          title: "Full Name",
          hintText: "Sophia Loren",
          prefixIcon: const Icon(
            Icons.person_outline,
            color: AppColors.grayClr,
            size: 20,
          ),
        ),
        const SizedBox(height: 16),

        // ── Email Address
        CustomTextField(
          title: "Email Address",
          hintText: "name@domain.com",
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: AppColors.grayClr,
            size: 20,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        // Custom file: custom_password_field.dart
        CustomPasswordField(
          label: "Password",
          hint: "lamsaDesign2025",
          obscure: _hiddenPassword,
          controller: _passwordctrl,
          onToggle: () => setState(() => _hiddenPassword = !_hiddenPassword),
        ),

        // Custom file: password_bar.dart
        const PasswordBar(
          filledCount: 3,
          label: "Strong password",
          color: AppColors.primaryClr,
        ),
        const SizedBox(height: 16),

        // Custom file: custom_password_field.dart
        CustomPasswordField(
          label: "Confirm Password",
          hint: "LamsaDesign2025",
          obscure: _obscureConfirm,
          controller: _confirmctrl,
          onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
        ),
        const SizedBox(height: 16),

        // ── Terms checkbox
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _agreeToTerms,
                onChanged: (v) => setState(() => _agreeToTerms = v ?? false),
                activeColor: AppColors.primaryClr,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "I agree to the ",
                  style: AppStyles.style13Regular.copyWith(
                    fontFamily: "Manrope",
                    color: AppColors.textClr,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms of Service",
                      style: AppStyles.style13SemiBold.copyWith(
                        fontFamily: "Manrope",
                        color: AppColors.primaryClr,
                      ),
                    ),
                    const TextSpan(text: " & "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppStyles.style13SemiBold.copyWith(
                        fontFamily: "Manrope",
                        color: AppColors.primaryClr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // ── Create Account button
        CustomElevatedButton(
          text: "Create Account",
          onPressed: _agreeToTerms
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailVerificationScreen(
                      email: _emailctrl.text.isNotEmpty
                          ? _emailctrl.text
                          : "sop***@domain.com",
                    ),
                  ),
                )
              : null,
        ),
        const SizedBox(height: 20),

        // ── Sign In link
        Center(
          child: Text.rich(
            TextSpan(
              text: "Already have an account? ",
              style: AppStyles.style14Regular.copyWith(
                fontFamily: "Manrope",
                color: AppColors.grayClr,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Sign In",
                      style: AppStyles.style14Bold.copyWith(
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
        const SizedBox(height: 24),
      ],
    );
  }
}
