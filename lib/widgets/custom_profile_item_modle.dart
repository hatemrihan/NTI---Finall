import 'package:flutter/material.dart';

class ProfileItemModle1 {
  final String title;
  final IconData icon;
  final IconData Ricon;

  ProfileItemModle1({
    required this.title,
    required this.icon,
    required this.Ricon,
  });
}

class ProfileItemModle2 {
  final String title;
  final IconData icon;
  final IconData Ricon;
  final void Function()? onTap;

  ProfileItemModle2({
    required this.title,
    required this.icon,
    required this.Ricon,
    this.onTap,
  });
}