import 'package:final_project/screens/Category_Products_screen.dart';
import 'package:final_project/screens/cart_screen.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/screens/profile_screen.dart';
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
    HomeScreen(),              // index 0
    CategoryProductsScreen(),  // index 1
    CartScreen(),              // index 2
    ProfileScreen(),           // index 3
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
