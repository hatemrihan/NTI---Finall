import 'package:flutter/material.dart';

class ProfileItemModel1 {
  final String title;
  final IconData icon;
  final IconData rightIcon;

  ProfileItemModel1({
    required this.title,
    required this.icon,
    required this.rightIcon,
  });
}

class ProfileItemModel2 {
  final String title;
  final IconData icon;
  final IconData rightIcon;
  final void Function()? onTap;

  ProfileItemModel2({
    required this.title,
    required this.icon,
    required this.rightIcon,
    this.onTap,
  });
}
