import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({
    super.key,
    required this.logo,
    required this.title,
    required this.subTitle,
  });

  final String logo, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          logo,
          style: AppStyles.style28ExtraBold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.textClr,
          ),
        ),
        SizedBox(height: 16),
        Text(
          title,
          style: AppStyles.style24Bold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.textClr,
          ),
        ),
        SizedBox(height: 6),
        Text(
          subTitle,
          style: AppStyles.style14Regular.copyWith(color: AppColors.grayClr),
        ),
      ],
    );
  }
}
