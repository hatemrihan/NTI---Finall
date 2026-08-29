import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'NOMA',
              style: AppStyles.style48ExtraBold.copyWith(
                fontFamily: "Manrope",
                letterSpacing: 0.2,
                color: AppColors.textClr,
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.primaryClr,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'SMART ACCESSORIES STORE',
              style: AppStyles.style14Medium.copyWith(
                color: AppColors.grayClr,
                height: 1.2,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
