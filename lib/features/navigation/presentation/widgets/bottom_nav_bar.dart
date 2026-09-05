import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key, required this.currentIndex, this.onTap});

  final int currentIndex;
  final Function(int)? onTap;
  final List<Widget> screens =[

  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.cardFillClr,
      selectedItemColor: AppColors.primaryClr,
      unselectedItemColor: AppColors.hintClr,
      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          activeIcon: Icon(Icons.grid_view),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: "Cart",
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.favorite_border),
        //   activeIcon: Icon(Icons.favorite),
        //   label: "WishList",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
