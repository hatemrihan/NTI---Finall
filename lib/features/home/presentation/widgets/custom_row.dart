import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({super.key, 
    required this.icon,
    required this.title,
    required this.trailing,
  });

  final IconData icon;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: AppColors.primaryClr,
            ),

            const SizedBox(width: 10),

            Text(
              title,
              style: AppStyles.style16SemiBold
            ),

            const Spacer(),

            trailing,
          ],
        ),
      ),
    );
  }
}