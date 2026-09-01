import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';

import 'package:flutter/material.dart';

class BuildCategoryDropdown extends StatefulWidget {
  const BuildCategoryDropdown({super.key});

  @override
  State<BuildCategoryDropdown> createState() => _BuildCategoryDropdownState();
}

String? _selectedCategory;

class _BuildCategoryDropdownState extends State<BuildCategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    final List<String> _categories = [
      'Jewelry',
      'Clothing',
      'Accessories',
      'Home',
      'Electronics',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CATEGORY',
          style: AppStyles.style14SemiBold.copyWith(color: AppColors.textClr),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.whiteClr,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.whiteClr),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCategory ?? _categories.first,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: _categories
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category,
                        style: AppStyles.style14Bold.copyWith(
                          color: AppColors.textClr,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
