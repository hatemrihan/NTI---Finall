import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';

import 'package:flutter/material.dart';

class BuildImageUploadContainer extends StatefulWidget {
  final Function(String) onImageSelected;
  const BuildImageUploadContainer({super.key, required this.onImageSelected });

  @override
  State<BuildImageUploadContainer> createState() =>
      BuildImageUploadContainerState();
}

class BuildImageUploadContainerState extends State<BuildImageUploadContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String imageUrl = "https://images.unsplash.com/photo-1617038220319-276d3cfab638?w=500&auto=format&fit=crop&q=60";
        widget.onImageSelected(imageUrl);
      },
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.cardFillClr,
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
            Icon(Icons.add, size: 32, color: AppColors.grayClr),
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
