import 'package:flutter/material.dart';

class Customarrowback extends StatelessWidget {
  const Customarrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE8DECF), width: 1.5),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1E2522),
            size: 20,
          ),
        ),
      ),
    );
  }
}
