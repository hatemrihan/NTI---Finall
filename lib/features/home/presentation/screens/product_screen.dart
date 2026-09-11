import 'dart:developer';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/data/models/product_model.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_states.dart';
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
    context.read<ReviewCubit>().getReviews(productId: (widget.product.id ?? ''));
    }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is addToCartloding) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('loading.....'),
              backgroundColor: AppColors.bron2Clr,
            ),
          );
        } else if (state is addToCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erorr......'),
              backgroundColor: AppColors.redClr,
            ),
          );
        } else if (state is addToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('success......'),
              backgroundColor: AppColors.primaryClr,
            ),
          );
        }
      },
      child: Scaffold(
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
            icon: Icon(Icons.arrow_back_ios_new),
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
                        oldPrice: widget.product.price * 1.3,
                        rating: context.read<ReviewCubit>().averageRating,
                        reviews: context.read<ReviewCubit>().reviewsCount,
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
                            BlocProvider.of<ProductsCubit>(
                              context,
                            ).addToCart(widget.product.id);
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
                  DescriptionSection(description: widget.product.description),
                  SizedBox(height: 20),
                  //* Reviews Section
                  BlocBuilder<ReviewCubit, ReviewState>(
                    builder: (context, state) {
                      if (state is ReviewLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(color: AppColors.primaryClr,),
                        );
                      } else if (state is ReviewFailureState) {
                        return Center(
                          child: Text('Failed to load reviews', style: AppStyles.style16Regular.copyWith(color: AppColors.hintClr),),
                        );
                      } else if (context.read<ReviewCubit>().reviews.isEmpty) {
                        return Center(
                          child: Text('No reviews yet', style: AppStyles.style16Regular.copyWith(color: AppColors.hintClr),),
                        );
                      } else {
                        return ReviewsSection(
                          reviews: context.read<ReviewCubit>().reviews,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 12),
                  WriteReview(
                    productId: widget.product.id ?? '',
                    onReviewAdded: () {
                      context.read<ReviewCubit>().getReviews(
                        productId: widget.product.id ?? '',
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}