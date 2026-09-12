import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/custom_categories_home.dart';
import 'package:final_project/features/home/presentation/widgets/cutom_gridview_home.dart';
import 'package:final_project/features/home/presentation/widgets/home_screen_header.dart';
import 'package:final_project/features/home/presentation/widgets/offers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onTabChange});
  final ValueChanged<int>? onTabChange;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()
        ..getCategories()
        ..getProducts()
        ..getOffers(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundClr,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeScreenHeader(onTabChange: onTabChange),
                  const SizedBox(height: 24),
                  OffersSection(),
                  const SizedBox(height: 20),
                  Text(
                    "Categories",
                    style: AppStyles.style16SemiBold.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textClr,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomCategoriesHome(onTabChange: onTabChange),
                  const SizedBox(height: 20),
                  Text(
                    "Trending Now",
                    style: AppStyles.style16SemiBold.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textClr,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const CutomGridviewHome(),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
