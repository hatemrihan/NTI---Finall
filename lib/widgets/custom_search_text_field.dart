import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bottomBackgroundClr,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: AppStyles.style14Regular.copyWith(color: AppColors.grayClr),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.primaryClr, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
