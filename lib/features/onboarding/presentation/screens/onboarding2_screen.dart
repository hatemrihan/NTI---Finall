import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/features/onboarding/presentation/screens/onboarding3_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_img_section.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_text_section.dart';
import 'package:flutter/material.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomBackgroundClr,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            OnboardingImgSection(imgPath: 'assets/images/onBoarding2_img.png'),
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
                      title: 'Shop With Confidence',
                      subTitle:
                          'Experience seamless secure checkout, tracking updates, and simple stress-free returns for every order.',
                    ),
                    Spacer(),
                    OnboardingPageIndicator(currentPage: 1),
                    SizedBox(height: 32),
                    CustomElevatedButton(
                      text: 'Next',
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding3Screen(),
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
