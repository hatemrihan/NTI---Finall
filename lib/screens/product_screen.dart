import 'dart:developer';

import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/widgets/bottom_nav_bar.dart';
import 'package:final_project/widgets/color_button.dart';
import 'package:final_project/widgets/counter_button.dart';
import 'package:final_project/widgets/product_info.dart';
import 'package:final_project/widgets/review_cart_details.dart';
import 'package:final_project/widgets/size_button.dart';
import 'package:final_project/widgets/write_review.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ProductDetails()),
  );
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundClr,
        leadingWidth: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.cardFillClr,
            side: BorderSide(color: AppColors.borderSideClr),
          ),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.cardFillClr,
              side: BorderSide(color: AppColors.borderSideClr),
            ),
            icon: Icon(Icons.share_outlined),
          ),
          SizedBox(height: 16),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.cardFillClr,
              side: BorderSide(color: AppColors.borderSideClr),
            ),
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Color(0xffB9785B),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfo(
                  image: "assets/images/hour.png",
                  brand: "MERIDIAN",
                  description: "Classic leather Chronograph",
                  price: 245.00,
                  oldPrice: 320.00,
                  rating: 4.8,
                  reviews: 124,
                ),
                SizedBox(height: 20),
                Divider(color: Color(0xffE8DDCB)),
                SizedBox(height: 20),
                Text('Select Color', style: AppStyles.style13Bold),
                SizedBox(height: 8),
                Row(
                  spacing: 10,
                  children: [
                    ColorButton(color: AppColors.primaryClr, text: "green"),
                    ColorButton(color: Color(0xffB9785B), text: "color"),
                    ColorButton(color: AppColors.blackClr, text: "black"),
                    ColorButton(color: Color(0xffE8DDCB), text: "color"),
                  ],
                ),
                SizedBox(height: 20),
                Text("Select Size", style: AppStyles.style13Bold),
                SizedBox(height: 8),
                Row(
                  spacing: 6,
                  children: [
                    SizeButton(
                      size: "S",
                      width: 20,
                      height: 50,
                      isSelected: selectedSize == "S",
                      onPressed: () {
                        setState(() {
                          selectedSize = "S";
                        });
                      },
                    ),
                    SizeButton(
                      size: "M",
                      width: 20,
                      height: 50,
                      isSelected: selectedSize == "M",
                      onPressed: () {
                        setState(() {
                          selectedSize = "M";
                        });
                      },
                    ),
                    SizeButton(
                      size: "L",
                      width: 20,
                      height: 50,
                      isSelected: selectedSize == "L",
                      onPressed: () {
                        setState(() {
                          selectedSize = "L";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CounterButton(),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          log("add to cart pressed");
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: AppColors.primaryClr,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Add to Cart",
                                style: AppStyles.style16Bold.copyWith(
                                  color: AppColors.whiteClr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //* Description Section
                Card(
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_up),
                            ),
                          ],
                        ),
                        Text(
                          "A high-precision design meticulously built. Featuring premium full-grain Italian calfskin strap, Japanese quartz movement, sapphire crystal scratch-resistant casing, and functional dual subdials. Water resistant up to 5 ATM.",
                          style: AppStyles.style13Regular.copyWith(
                            color: AppColors.hintClr,
                          ),
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //* Reviews Section
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
                  review:
                      "Stunning craft. The leather strap is extremely supple, and the chronograph movement is reliable. Truly luxury for an everyday routine.",
                ),
                SizedBox(height: 5),
                ReviewCartDetails(
                  reviewerFirstLetter: "D",
                  name: "David L.",
                  date: "Oct 18, 2023",
                  rating: 4.0,
                  review:
                      "Minimalist layout with outstanding weight. A true compliment earner. Packaging was elegant and delivery prompt.",
                ),
                SizedBox(height: 12),
                WriteReview(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
