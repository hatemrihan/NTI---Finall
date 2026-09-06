import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_img_section.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomBackgroundClr,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            OnboardingImgSection(imgPath: 'assets/images/onBoarding3_img.png'),
            Positioned(
              top: 370,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.bottomBackgroundClr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(24, 34, 24, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OnboardingTextSection(
                      title: 'Join the LAMSA Community',
                      subTitle:
                          'Unlock early access to exclusive drops, curated editorial content, and premium member benefits.',
                    ),
                    Spacer(),
                    OnboardingPageIndicator(currentPage: 2),
                    SizedBox(height: 32),
                    CustomElevatedButton(
                      text: 'Get Started',
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AuthCubit(),
                            child: LoginScreen(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
