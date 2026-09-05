import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/features/onboarding/presentation/screens/onboarding2_screen.dart';
import 'package:final_project/core/widgets/custom_elevated_buttom.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_img_section.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:final_project/features/onboarding/presentation/widgets/onboarding_text_section.dart';
import 'package:flutter/material.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomBackgroundClr,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            OnboardingImgSection(imgPath: 'assets/images/onBoarding1_img.png'),
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
                      title: 'Discover Curated Accessories',
                      subTitle:
                          'Every piece in our collection is handpicked for its quality, timelessness, and premium craftsmanship.',
                    ),
                    Spacer(),
                    OnboardingPageIndicator(currentPage: 0),
                    SizedBox(height: 32),
                    CustomElevatedButton(
                      text: 'Next',
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding2Screen(),
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
