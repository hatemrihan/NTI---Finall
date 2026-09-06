import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
    radius: 14,
    child: ElevatedButton(onPressed: (){},
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    ),
    child: Text(text)),
  );
  }
}