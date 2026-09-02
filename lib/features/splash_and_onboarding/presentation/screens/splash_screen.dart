import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:final_project/features/splash_and_onboarding/presentation/screens/onBoarding1_screen.dart';
import 'package:final_project/features/splash_and_onboarding/presentation/screens/onboarding3_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Onboarding1Screen(),
            ),
          );
        },
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/splash_screen.png',fit: BoxFit.cover,),
            ),
            Positioned(
              top: 290,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset('assets/images/logo.png',width: 190,),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Text('Accessories For Touch You', style: AppStyles.style16Bold.copyWith( color: AppColors.whiteClr,), textAlign: TextAlign.center,)
            ),
          ],
        ),
      ),
    );
  }
}
