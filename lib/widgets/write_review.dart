import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({super.key});

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(color: AppColors.whiteClr, borderRadius: BorderRadius.circular(45), border: Border.all(color: AppColors.primaryClr, width: 2)),
      child: InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          // log("write a Review pressed");
          //* Open Bottom Sheet for add new review
          showModalBottomSheet(
            context: context,
            builder: (context) {
              double selectedStars = 0;
              return StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 900,
                    decoration: BoxDecoration(color: AppColors.cardFillClr, borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Container(width: 50, height: 5, decoration: BoxDecoration(color: AppColors.borderSideClr, borderRadius: BorderRadius.circular(10)))),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text("Write a Review", style: AppStyles.style20ExtraBold),
                              Spacer(),
                              IconButton(onPressed: () {Navigator.pop(context);}, style: IconButton.styleFrom(backgroundColor: AppColors.cardFillClr, side: BorderSide(color: AppColors.borderSideClr)), icon: Icon(Icons.cancel_outlined, fontWeight: FontWeight.w900)),
                            ],
                          ),
                          Text("Select Rating", style: AppStyles.style13SemiBold),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(onTap: () { setState(() => selectedStars = 1); }, child: Icon(Icons.star_border_rounded, color: selectedStars >= 1 ? AppColors.primaryClr : AppColors.borderSideClr, size: 40)),
                                InkWell(onTap: () { setState(() => selectedStars = 2); }, child: Icon(Icons.star_border_rounded, color: selectedStars >= 2 ? AppColors.primaryClr : AppColors.borderSideClr, size: 40)),
                                InkWell(onTap: () { setState(() => selectedStars = 3); }, child: Icon(Icons.star_border_rounded, color: selectedStars >= 3 ? AppColors.primaryClr : AppColors.borderSideClr, size: 40)),
                                InkWell(onTap: () { setState(() => selectedStars = 4); }, child: Icon(Icons.star_border_rounded, color: selectedStars >= 4 ? AppColors.primaryClr : AppColors.borderSideClr, size: 40)),
                                InkWell(onTap: () { setState(() => selectedStars = 5); }, child: Icon(Icons.star_border_rounded, color: selectedStars >= 5 ? AppColors.primaryClr : AppColors.borderSideClr, size: 40)),
                                SizedBox(width: 8),
                                Text("$selectedStars / 5.0"),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text("Review Title", style: AppStyles.style13SemiBold),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Color(0xffF6F2EA),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.borderSideClr)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 9, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Highly Recommended!", style: AppStyles.style13Regular.copyWith(color: AppColors.blackClr)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text("Review Description", style: AppStyles.style13SemiBold),
                          Card(
                            color: Color(0xffF6F2EA),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.borderSideClr)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 9, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("The design is gorgeous. Everything sits neatly on the wrist, leather is soft as described. Packaging is exquisite. Would recommend to anyone looking for a clean everyday chronograph.", style: AppStyles.style14Regular.copyWith(color: AppColors.blackClr), maxLines: 8),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(color: AppColors.primaryClr, borderRadius: BorderRadius.circular(45)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(45),
                              onTap: () {},
                              child: Center(child: Text("Submit Review", style: AppStyles.style16Bold.copyWith(color: AppColors.whiteClr))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit_outlined, color: Color(0xff2D5143), size: 30),
            const SizedBox(width: 12),
            Text("Write a Review", style: AppStyles.style14Bold.copyWith(color: AppColors.primaryClr)),
          ],
        ),
      ),
    );
  }
}