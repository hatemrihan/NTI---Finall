import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class OnboardingImgSection extends StatelessWidget {
  const OnboardingImgSection({super.key, required this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imgPath,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 15,
          right: 15,
          child: CustomTextButton(
            text: "skip",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ),
            textClr: AppColors.grayClr,
          ),
        ),
      ],
    );
  }
}
