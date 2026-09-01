import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/splash_screen.png',fit: BoxFit.cover,),
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset('assets/images/logo.png',width: 120, ),
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Text( 'Accessories For Touch You', textAlign: TextAlign.center, style: AppStyles.style16Bold, ),
          ),
        ],
      ),
    );
  }
}
