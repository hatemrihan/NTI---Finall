// Custom widget: Shared title + subtitle header for authentication screens
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.style28Bold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.textClr,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: AppStyles.style14Regular.copyWith(
            fontFamily: "Manrope",
            color: AppColors.grayClr,
          ),
        ),
      ],
    );
  }
}
