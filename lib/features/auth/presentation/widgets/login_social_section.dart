import 'package:flutter/material.dart';
import 'package:final_project/widgets/custom_social_button.dart';

class LoginSocialSection extends StatelessWidget {
  const LoginSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: CustomSocialButton(
            text: 'Google',
            iconPath: 'assets/icons/google_icon.svg',
          ),
        ),
        Expanded(
          child: CustomSocialButton(
            text: 'Apple',
            iconPath: 'assets/icons/apple_icon.svg',
          ),
        ),
      ],
    );
  }
}
