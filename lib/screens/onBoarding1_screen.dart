import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/screens/onBoarding2_screen.dart';
import 'package:final_project/widgets/custom_elevated_buttom.dart';
import 'package:final_project/widgets/custom_text_button.dart';
import 'package:final_project/widgets/onboarding_page_indicator.dart';
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
            Stack(
              children: [
                Image.asset(
                  'assets/images/onBoarding1_img.png',
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
            ),
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
                    Text(
                      'Discover Curated Accessories',
                      style: AppStyles.style28Bold.copyWith(
                        color: AppColors.textClr,
                        fontFamily: "Manrope",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Every piece in our collection is handpicked for its quality, timelessness, and premium craftsmanship.',
                      style: AppStyles.style18.copyWith(
                        color: AppColors.grayClr,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
