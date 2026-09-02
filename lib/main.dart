import 'package:final_project/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NEMOStore());
}

class NEMOStore extends StatelessWidget {
  const NEMOStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Manrope"),
      debugShowCheckedModeBanner: false,
      home:BottomNavigationBarScreen(),
    );
  }
}