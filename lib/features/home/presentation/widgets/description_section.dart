import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardFillClr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.borderSideClr),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 9, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Description", style: AppStyles.style16Bold),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_up)),
              ],
            ),
            Text(
              description,
              style: AppStyles.style13Regular.copyWith(color: AppColors.hintClr),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}