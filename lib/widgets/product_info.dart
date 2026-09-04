import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.image,
    required this.brand,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
  });
  final String image;
  final String brand;
  final String description;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(image),
        ),
        SizedBox(height: 20),
        Text(
          brand,
          style: AppStyles.style13Bold.copyWith(color: Color(0xff7B827A)),
        ),
        SizedBox(height: 6),
        Text(description, style: AppStyles.style24ExtraBold),
        Row(
          spacing: 10,
          children: [
            Text("\$$price", style: AppStyles.style22Bold),
            Text("\$$oldPrice".toString(), style: AppStyles.style14w300),
            Container(
              width: 45,
              height: 21,
              decoration: BoxDecoration(
                color: Color(0xffB9785B),
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                  "SALE",
                  style: AppStyles.style11Bold.copyWith(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.star_border_rounded,
              color: AppColors.primaryClr,
              size: 20,
              fontWeight: FontWeight.w900,
            ),
            Text(
              "$rating",
              style: AppStyles.style16Bold.copyWith(color: Colors.black),
            ),
            Text(
              "($reviews reviews)",
              style: AppStyles.style16Bold.copyWith(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
