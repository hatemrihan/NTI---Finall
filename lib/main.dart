import 'package:final_project/features/splash_and_onboarding/presentation/screens/splash_screen.dart';
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
      home: SplashScreen(),
    );
  }
}
