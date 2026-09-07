import 'dart:developer';

import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/cart/presentation/widgets/review_cart_details.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Reviews (124)", style: AppStyles.style16Bold),
            Spacer(),
            InkWell(
              onTap: () {
                log("view All pressed");
              },
              child: Text(
                "View all",
                style: AppStyles.style13SemiBold.copyWith(
                  color: AppColors.primaryClr,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryClr,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ReviewCartDetails(
          reviewerFirstLetter: "S",
          name: "Sophia K.",
          date: "Oct 24, 2023",
          rating: 5.0,
          review: "Stunning craft. The leather strap is extremely supple, and the chronograph movement is reliable. Truly luxury for an everyday routine.",
        ),
        SizedBox(height: 5),
        ReviewCartDetails(
          reviewerFirstLetter: "D",
          name: "David L.",
          date: "Oct 18, 2023",
          rating: 4.0,
          review: "Minimalist layout with outstanding weight. A true compliment earner. Packaging was elegant and delivery prompt.",
        ),
      ],
    );
  }
}