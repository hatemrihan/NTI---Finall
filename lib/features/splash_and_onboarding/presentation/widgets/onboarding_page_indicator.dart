import 'package:final_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: index == currentPage ? 24 : 8,
          height: 8,
          margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
          decoration: BoxDecoration(
            color: index == currentPage
                ? AppColors.primaryClr
                : const Color(0xFFA8B8A4),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
