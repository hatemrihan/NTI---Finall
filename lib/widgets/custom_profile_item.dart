
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

class CustomProfileItems extends StatelessWidget {
  const CustomProfileItems({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.Ricon,
    this.onTap,
    this.text_color,
  });
  final String title;
  final IconData icon;
  final Color? color;
  final IconData? Ricon;
  final Color? text_color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(width: 25),
          Icon(icon, size: 30, color: color),
          const SizedBox(width: 30),
          Text(title, style: AppStyles.style17Bold.copyWith(color: text_color)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Ricon)),
        ],
      ),
    );
  }
}
