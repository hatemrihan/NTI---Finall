import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordTextSection extends StatelessWidget {
  const PasswordTextSection({
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
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: AppStyles.style14Regular.copyWith(
            color: AppColors.grayClr,
          ),
        ),
      ],
    );
  }
}
