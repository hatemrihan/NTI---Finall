// Custom widget: Password text field with lock icon and visibility toggle
import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.obscure,
    required this.onToggle,
    this.controller,
  });

  final String label;
  final String hint;
  final bool obscure;
  final VoidCallback onToggle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          label,
          style: AppStyles.style14SemiBold.copyWith(
            fontFamily: "Manrope",
            color: AppColors.primaryClr,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bottomBackgroundClr,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.grayClr,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: onToggle,
              icon: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.grayClr,
                size: 20,
              ),
            ),
            hintText: hint,
            hintStyle: AppStyles.style14Regular.copyWith(
              color: AppColors.grayClr,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.primaryClr,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
