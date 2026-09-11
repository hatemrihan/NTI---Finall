import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({super.key, required this.color,required this.isSelected, this.onPressed});
  final Color color;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        padding: isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected? Border.all( color: color, width: 2,): null,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}