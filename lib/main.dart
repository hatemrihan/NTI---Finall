import 'package:final_project/screens/contact_us_screen.dart';
import 'package:final_project/screens/onBoarding1_screen.dart';
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
      // home: Onboarding1Screen(),
      home: ContactUsScreen(),
    );
  }
}
