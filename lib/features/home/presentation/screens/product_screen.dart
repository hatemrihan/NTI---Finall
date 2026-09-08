import 'dart:developer';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:final_project/features/home/presentation/widgets/counter_button.dart';
import 'package:final_project/features/home/presentation/widgets/description_section.dart';
import 'package:final_project/features/home/presentation/widgets/product_info.dart';
import 'package:final_project/features/home/presentation/widgets/product_options.dart';
import 'package:final_project/features/home/presentation/widgets/reviews_section.dart';
import 'package:final_project/features/reviews/presentation/reviews_cubit/reviews_cubit.dart';
import 'package:final_project/features/reviews/presentation/reviews_cubit/reviews_states.dart';
import 'package:final_project/features/reviews/presentation/widgets/write_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedSize;
  @override
  void initState() {
    super.initState();
    context.read<ReviewCubit>().getReviews( productId: widget.product.id,);
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
                  BlocBuilder<ReviewCubit, ReviewState>(
                    builder: (context, state) {
                      return ProductInfo(
                        image: widget.product.coverPictureUrl,
                        brand: widget.product.name,
                        description: widget.product.description,
                        price: widget.product.price,
                        oldPrice: widget.product.price + 900, rating: context.read<ReviewCubit>().averageRating, reviews: context.read<ReviewCubit>().reviewsCount,
                      );
                    },
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
                  BlocBuilder<ReviewCubit, ReviewState>(
                    builder: (context, state) {
                      if(state is ReviewLoadingState){
                        return Center(child: CircularProgressIndicator());
                      } else if(state is ReviewFailureState){
                        return Center(child: Text("Failed to load reviews"));
                      }else if(state is ReviewSuccessState){
                        return ReviewsSection(reviews: context.read<ReviewCubit>().reviews,);
                      }
                      return ReviewsSection(reviews: [],);
                    },
                  ),
                  SizedBox(height: 12),
                  WriteReview(
                    productId: widget.product.id,
                    onReviewAdded: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.primaryClr,
                        content: Text("Review added successfully"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    context.read<ReviewCubit>().getReviews(
                      productId: widget.product.id,
                    );
                  },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
  }
}