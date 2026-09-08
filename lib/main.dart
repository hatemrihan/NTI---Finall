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
      home: SplashScreen(),
    );
  }
}
