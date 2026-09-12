import 'dart:developer';

import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_states.dart';
import 'package:final_project/features/home/presentation/screens/product_screen.dart';
import 'package:final_project/features/reviews/presentation/reviews_cubit/reviews_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CutomGridviewHome extends StatelessWidget {
  const CutomGridviewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listenWhen: (previous, current) =>
          current is addToCartloding ||
          current is addToCartSuccess ||
          current is addToCartFailure ||
          current is DeleteProductLoadingState ||
          current is DeleteProductSuccessState ||
          current is DeleteProductFailureState,
      listener: (context, state) {
        if (state is addToCartloding) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('loading.....'),
              backgroundColor: AppColors.brown2Clr,
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
        } else if (state is DeleteProductLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Deleting product...'),
              backgroundColor: Colors.orange,
            ),
          );
        } else if (state is DeleteProductFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.redClr,
            ),
          );
        } else if (state is DeleteProductSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.primaryClr,
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is GetProductsLoadingState ||
          current is GetProductsSuccessState ||
          current is GetProductsFailureState ||
          current is SearchProductsLoadingState ||
          current is SearchProductsSuccessState ||
          current is SearchProductsFailureState ||
          current is ProductsInitialState,
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();

        if (cubit.isProductsLoading ||
            (state is ProductsInitialState && cubit.products.isEmpty) ||
            (state is GetProductsLoadingState)) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is GetProductsFailureState && cubit.products.isEmpty) {
          return Center(
            child: Text(
              state.error ?? "Failed to load products",
              style: AppStyles.style14SemiBold.copyWith(color: Colors.red),
            ),
          );
        }

        if (cubit.products.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text("No products available"),
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            final product = cubit.products[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => ProductsCubit()),
                        BlocProvider(create: (context) => ReviewCubit()),
                      ],
                      child: ProductDetails(product: product),
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: AppColors.bottomBackgroundClr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(
                              product.coverPictureUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 35,
                                  ),
                                );
                              },
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 2, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: AppStyles.style12SemiBold.copyWith(
                              color: AppColors.grayClr,
                            ),
                          ),
                          Text(
                            product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.style16SemiBold.copyWith(
                              color: AppColors.textClr,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 2, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: AppStyles.style11Bold.copyWith(
                                  color: AppColors.grayClr,
                                ),
                              ),
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.style14SemiBold.copyWith(
                                  color: AppColors.textClr,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$${product.price.toString()}",
                                    style: AppStyles.style14Bold,
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    color: AppColors.primaryClr,
                                    onPressed: () {
                                      BlocProvider.of<ProductsCubit>(
                                        context,
                                      ).addToCart(product.id);
                                    },
                                    icon: const Icon(Icons.add_circle_outlined),
                                  ),
                                ],
                                "\$${product.price.toString()}",
                                style: AppStyles.style16Bold,
                              ),
                              const Spacer(),
                              IconButton(
                                color: AppColors.primaryClr,
                                onPressed: () {
                                  BlocProvider.of<ProductsCubit>(
                                    context,
                                  ).addToCart(product.id);
                                },
                                icon: Icon(Icons.add_circle_outlined,
                                size: 35,
                                color: AppColors.primaryClr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withValues(alpha: 0.2),
                      radius: 18,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.delete_sweep,
                          color: Colors.red,
                          size: 20,
                        ),
                        onPressed: () {
                          context.read<ProductsCubit>().deleteProduct(
                            productId: product.id.toString(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
