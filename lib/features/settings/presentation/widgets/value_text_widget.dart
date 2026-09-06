import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ValueTextWidget extends StatelessWidget {
  final String title;
  final String description;
  const ValueTextWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '• ',
            style: AppStyles.style14Regular.copyWith(
              color: AppColors.grayClr,
            ),
          ),
          TextSpan(
            text: '$title ',
            style: AppStyles.style14Bold.copyWith(
              color: AppColors.textClr,
            ),
          ),
          TextSpan(
            text: description,
            style: AppStyles.style13Regular.copyWith(
              color: AppColors.grayClr,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}