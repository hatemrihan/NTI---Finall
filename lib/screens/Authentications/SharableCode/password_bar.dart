// Custom widget: 4-segment bar that shows how strong the password is
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordBar extends StatelessWidget {
  const PasswordBar({
    super.key,
    required this.filledCount,
    required this.label,
    required this.color,
  });

  final int filledCount; // how many of 4 segments are filled (0-4)
  final String label; // e.g. "Strong password" or "Excellent password"
  final Color color; // color for filled segments and label text

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          spacing: 6,
          children: List.generate(4, (i) {
            return Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: i < filledCount
                      ? color
                      : AppColors.grayClr.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppStyles.style12.copyWith(
            fontFamily: "Manrope",
            color: color,
          ),
        ),
      ],
    );
  }
}
