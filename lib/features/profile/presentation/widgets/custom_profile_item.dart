import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomProfileItems extends StatelessWidget {
  const CustomProfileItems({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.rightIcon,
    this.onTap,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final Color? color;
  final IconData? rightIcon;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, size: 28, color: color ?? AppColors.primaryClr),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: AppStyles.style16SemiBold.copyWith(
                  color: textColor ?? AppColors.textClr,
                ),
              ),
            ),
            if (rightIcon != null)
              Icon(rightIcon, size: 18, color: AppColors.grayClr),
          ],
        ),
      ),
    );
  }
}
