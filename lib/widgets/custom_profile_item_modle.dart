import 'package:flutter/material.dart';

class ProfileItemModle1 {
  final String title;
  final IconData icon;
  final IconData rightIcon;

  ProfileItemModle1({
    required this.title,
    required this.icon,
    required this.rightIcon,
  });
}

class ProfileItemModle2 {
  final String title;
  final IconData icon;
  final IconData rightIcon;
  final void Function()? onTap;

  ProfileItemModle2({
    required this.title,
    required this.icon,
    required this.rightIcon,
    this.onTap,
  });
}
