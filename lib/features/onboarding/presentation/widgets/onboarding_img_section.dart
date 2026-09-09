import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/widgets/custom_text_button.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: LoginScreen(),
                ),
              ),
            ),
            textClr: AppColors.grayClr,
          ),
        ),
      ],
    );
  }
}
