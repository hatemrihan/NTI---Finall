<<<<<<< HEAD
import 'package:final_project/screens/cart_screen.dart';
import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/screens/onboarding3_screen.dart';
=======
import 'package:final_project/features/splash_and_onboarding/presentation/screens/splash_screen.dart';
>>>>>>> 466190acce2425262b2cfb630a0e8885b732cd48
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
<<<<<<< HEAD
      home: CartScreen(),
=======
      home: SplashScreen(),
>>>>>>> 466190acce2425262b2cfb630a0e8885b732cd48
    );
  }
}
