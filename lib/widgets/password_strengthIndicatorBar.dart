import 'package:flutter/material.dart';

class Passwordindicatorbar extends StatelessWidget {
  const Passwordindicatorbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: Color(0xFFC88A68),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
