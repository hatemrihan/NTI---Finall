import 'package:flutter/material.dart';

class OnboardingImgSection extends StatelessWidget {
  const OnboardingImgSection({super.key, required this.imgPath});
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        imgPath,
        fit: BoxFit.cover,
        height: 420,
      ),
    );
  }
}
