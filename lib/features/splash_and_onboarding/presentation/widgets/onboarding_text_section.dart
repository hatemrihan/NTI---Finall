import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({super.key, required this.title, required this.subTitle});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.style28Bold.copyWith(
            color: AppColors.textClr,
            fontFamily: "Manrope",
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 15),
        Text(
          subTitle,
          style: AppStyles.style18Regular.copyWith(
            color: AppColors.grayClr,
            height: 1.5,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
