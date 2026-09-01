import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:final_project/widgets/custom_categories_home.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/cutom_gridview_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Noma",
                      style: AppStyles.style28ExtraBold.copyWith(
                        color: AppColors.textClr,
                        fontSize: 24,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.textClr,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.wallet_outlined,
                        color: AppColors.textClr,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  title: '',
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search_outlined),
                ),
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
    );
  }
}
