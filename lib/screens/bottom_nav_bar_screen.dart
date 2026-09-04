import 'package:final_project/screens/category_products_screen.dart';
import 'package:final_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/features/profile/presentation/screens/profile_screen.dart';
import 'package:final_project/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends State<BottomNavigationBarScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    CategoryProductsScreen(),
    CartScreen(),
    //WishListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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