import 'package:final_project/app_colors.dart';
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
  });
  final String title;
  final IconData icon;
  final Color? color;
  final IconData? Ricon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(width: 30),
          Icon(icon, size: 28, color: color),
          const SizedBox(width: 30),
          Text(title, style: AppStyles.style20ExtraBold.copyWith(color: color)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Ricon)),
        ],
      ),
    );
  }
}
