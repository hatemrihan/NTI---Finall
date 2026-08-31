import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.grayClr)),
        Text(
          '   Or Continue With   ',
          style: AppStyles.style14Regular.copyWith(color: AppColors.grayClr),
        ),
        Expanded(child: Divider(color: AppColors.grayClr)),
      ],
    );
  }
}
