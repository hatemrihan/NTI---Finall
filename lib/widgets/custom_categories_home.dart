import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/screens/category_products_screen.dart';
import 'package:flutter/material.dart';

class CustomCategoriesHome extends StatefulWidget {
  const CustomCategoriesHome({super.key});

  @override
  State<CustomCategoriesHome> createState() => _CustomCategoriesHomeState();
}

class _CustomCategoriesHomeState extends State<CustomCategoriesHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 105,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryProductsScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 40,
                      
                        backgroundImage: NetworkImage(
                          'https://talabat639.runasp.net/images/products/Frappuccino.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "name",
                      style: AppStyles.style12Medium.copyWith(
                        color: AppColors.textClr,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
