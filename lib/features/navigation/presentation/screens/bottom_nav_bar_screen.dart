import 'package:final_project/features/product/presentation/screens/category_products_screen.dart';
import 'package:final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/features/profile/presentation/screens/profile_screen.dart';
import 'package:final_project/features/navigation/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      
      const CategoryProductsScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
