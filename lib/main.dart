import 'package:final_project/screens/about_us_screen.dart';
import 'package:final_project/screens/cart_screen.dart';
import 'package:final_project/screens/onboarding1_screen.dart';
import 'package:final_project/screens/profile_screen.dart';
import 'package:final_project/screens/search_screen.dart';
import 'package:final_project/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NEMOStore());
}

class NEMOStore extends StatelessWidget {
  const NEMOStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Manrope"),
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
    );
  }
}
