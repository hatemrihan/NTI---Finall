import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
// import 'package:final_project/widgets/bottom_nav_bar.dart';
import 'package:final_project/widgets/custom_categories_home.dart';

import 'package:final_project/widgets/cutom_gridview_home.dart';
import 'package:final_project/features/home/presentation/widgets/home_screen_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeScreenHeader(),
                SizedBox(height: 24),
                Text(
                  "Categories",
                  style: AppStyles.style16SemiBold.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textClr,
                  ),
                ),
                SizedBox(height: 16),

                CustomCategoriesHome(),

                SizedBox(height: 20),
                Text(
                  "Trending Now",
                  style: AppStyles.style16SemiBold.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textClr,
                  ),
                ),
                SizedBox(height: 12),
                CutomGridviewHome(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar:BottomNavBar(),

    );
  }
}
