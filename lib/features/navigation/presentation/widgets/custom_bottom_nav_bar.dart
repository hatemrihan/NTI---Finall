import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onAddProduct;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onAddProduct,
  });

  static const List<IconData> _icons = [
    Icons.home_outlined,
    Icons.grid_view_outlined,
    Icons.shopping_cart_outlined,
    Icons.person_outline,
  ];

  static const List<IconData> _activeIcons = [
    Icons.home,
    Icons.grid_view,
    Icons.shopping_cart,
    Icons.person,
  ];

  static const List<String> _labels = ['Home', 'Categories', 'Cart', 'Profile'];

  Widget _buildNavItem(int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (AppColors.isDarkMode
                  ? AppColors.primaryClr.withValues(alpha: 0.25)
                  : const Color.fromARGB(255, 206, 237, 223))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? _activeIcons[index] : _icons[index],
              size: 25,
              color: isSelected ? AppColors.primaryClr : AppColors.grayClr,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        _labels[index],
                        style: AppStyles.style14SemiBold.copyWith(
                          color: AppColors.primaryClr,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bottomBackgroundClr,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: AppColors.isDarkMode ? 0.35 : 0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0),
            _buildNavItem(1),
            GestureDetector(
              onTap: onAddProduct,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.primaryClr,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
            _buildNavItem(2),
            _buildNavItem(3),
          ],
        ),
      ),
    );
  }
}
