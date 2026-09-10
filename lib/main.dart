import 'package:final_project/core/Token/token.dart';
import 'package:final_project/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadToken();

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