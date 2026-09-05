import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.style28ExtraBold.copyWith(
            color: AppColors.textClr,
          ),
        ),
        SizedBox(height: 12),
        Text(
          subTitle,
          style: AppStyles.style14Regular.copyWith(
            color: AppColors.grayClr,
          ),
        ),
      ],
    );
  }
}
