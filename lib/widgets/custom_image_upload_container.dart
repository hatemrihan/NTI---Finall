import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';

import 'package:flutter/material.dart';

class BuildImageUploadContainer extends StatefulWidget {
  const BuildImageUploadContainer({super.key});

  @override
  State<BuildImageUploadContainer> createState() =>
      BuildImageUploadContainerState();
}

class BuildImageUploadContainerState extends State<BuildImageUploadContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.whiteClr,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.grayClr,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, size: 32, color: AppColors.grayClr),
            const SizedBox(height: 8),
            const Text(
              'Upload Product Image',
              style: AppStyles.style13SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
