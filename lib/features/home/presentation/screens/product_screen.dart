import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/data/models/reviews_model.dart';
import 'package:final_project/features/home/presentation/screens/product_model.dart';
import 'package:final_project/features/home/presentation/widgets/counter_button.dart';
import 'package:final_project/features/home/presentation/widgets/description_section.dart';
import 'package:final_project/features/home/presentation/widgets/product_info.dart';
import 'package:final_project/features/home/presentation/widgets/product_options.dart';
import 'package:final_project/features/home/presentation/widgets/reviews_section.dart';
import 'package:final_project/features/home/presentation/widgets/write_review.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedSize;
  double averageRating = 0;
  int reviewsCount = 0;
    @override
    void initState() {
      super.initState();
      getReviews();
    }
    List<ReviewModel> reviews = [];
    final dio = Dio();

  Future<void> getReviews() async {
    log('get reviews');

    final Response response = await dio.get(
      'https://accessories-eshop.runasp.net/api/reviews/${widget.product.id}',
      options: Options(
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZGI2ZTkyNi02NzY3LTRmOTctMzVhZi0wOGRmMGMzZjg1NmQiLCJqdGkiOiI0MDEyNTNiMS03OGNhLTRiZjUtOWQzNS01OTQxMzhlNmVhZmUiLCJlbWFpbCI6ImFiZGVscmFobWFuM2lzbWFlbEBnbWFpbC5jb20iLCJuYW1lIjoiQWJkZWxyYWhtYW4gSXNtYWVpbCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc4OTAwNjcwNywiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.pKL-2VcG9RRzWJOYGxvIyx6fgE1dnisKnvNv4D6Qzf4',
    },
    ),
    );
      reviews.clear();
    averageRating = (response.data['averageRating'] ?? 0).toDouble();
    reviewsCount = response.data['reviewsCount'] ?? 0;
    log(response.data.toString());
    for (var element in response.data['reviews']['items']) {
      final ReviewModel model = ReviewModel.fromJson(element);
      reviews.add(model);
    }

    setState(() {});
    log(reviews.toString());
  }
  
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
          style: IconButton.styleFrom(backgroundColor: AppColors.cardFillClr, side: BorderSide(color: AppColors.borderSideClr)),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(backgroundColor: AppColors.cardFillClr, side: BorderSide(color: AppColors.borderSideClr)),
            icon: Icon(Icons.share_outlined),
          ),
          SizedBox(height: 16),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(backgroundColor: AppColors.cardFillClr, side: BorderSide(color: AppColors.borderSideClr)),
            icon: Icon(Icons.favorite_border_outlined, color: Color(0xffB9785B)),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfo(
                  image: widget.product.coverPictureUrl,
                  brand: widget.product.name,
                  description: widget.product.description,
                  price: widget.product.price,
                  oldPrice: widget.product.price + 900,
                  rating: averageRating,
                  reviews: reviewsCount,
                ),
                SizedBox(height: 20),
                Divider(color: Color(0xffE8DDCB)),
                SizedBox(height: 20),
                ProductOptions(),
                SizedBox(height: 20),
                Row(
                  children: [
                    CounterButton(),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          log("add to cart pressed ${widget.product.name}");
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(color: AppColors.primaryClr, borderRadius: BorderRadius.circular(26)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_bag_outlined, color: Colors.white),
                              SizedBox(width: 8),
                              Text("Add to Cart", style: AppStyles.style16Bold.copyWith(color: AppColors.whiteClr)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //* Description Section
                DescriptionSection(description: widget.product.description),
                SizedBox(height: 20),
                //* Reviews Section
                ReviewsSection(reviews: reviews,),
                SizedBox(height: 12),
                WriteReview(productId: widget.product.id,
                onReviewAdded: (){
                  getReviews();
                },),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}