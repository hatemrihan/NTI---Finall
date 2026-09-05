import 'package:final_project/screens/Authentications/manage_product_screen.dart';
import 'package:flutter/material.dart';

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
      home: ManageProductScreen(),
    );
  }
}
