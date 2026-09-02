import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  const SizeButton({
    super.key,
    required this.size,
    this.width = 30,
    this.height = 20,
    required this.onPressed,
    required this.isSelected,
  });
  final String size;
  final double width;
  final double height;
  final void Function()? onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          side: BorderSide(color: AppColors.borderSideClr),
          backgroundColor: isSelected
              ? AppColors.primaryClr
              : AppColors.cardFillClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          size,
          style: AppStyles.style16Bold.copyWith(
            color: isSelected ? AppColors.whiteClr : AppColors.blackClr,
          ),
        ),
      ),
    );
  }
}
