
import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.prefixIcon, this.maxLines =1, this.keyboardType,
  });
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.style14SemiBold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.primaryClr,
          ),
        ),
        TextField(
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bottomBackgroundClr,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: AppStyles.style14.copyWith(color: AppColors.grayClr),
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
