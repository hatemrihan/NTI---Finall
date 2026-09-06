// Custom widget: Password text field with lock icon and visibility toggle
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.maxLines = 1,
    this.keyboardType,
    this.controller,
    this.validator,
  });
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          title,
          style: AppStyles.style14SemiBold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.primaryClr,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bottomBackgroundClr,
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: AppStyles.style14Regular.copyWith(
              color: AppColors.grayClr,
            ),
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
