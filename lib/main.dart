<<<<<<< HEAD
=======
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/features/home/presentation/screens/home_screen.dart';
import 'package:final_project/features/splash/presentation/screen/splash_screen.dart';
>>>>>>> be445dc27f7886e77bbb294c0c708142c51cf495
import 'package:flutter/material.dart';
import 'package:final_project/features/splash/presentation/screen/splash_screen.dart';

void main() {
  runApp(const LAMSA());
}

class LAMSA extends StatelessWidget {
  const LAMSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAMSA',
      theme: ThemeData(fontFamily: "Manrope"),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: SplashScreen(),
=======
      home:  SplashScreen(),
>>>>>>> be445dc27f7886e77bbb294c0c708142c51cf495
    );
  }
}
