import 'dart:developer';

import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileItems extends StatelessWidget {
  const CustomProfileItems({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.rightIcon,
    this.onTap,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final Color? color;
  final IconData? rightIcon;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(width: 15),
            Text(
              title,
              style: AppStyles.style16SemiBold.copyWith(color: textColor),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
              },
              icon: Icon(rightIcon),
            ),
          ],
        ),
      ),
    );
  }
}
