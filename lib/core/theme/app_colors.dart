import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Controlled by ThemeCubit to allow static color getters to adapt dynamically.
  static bool isDarkMode = false;

  // Light Palette
  static const Color lightBackground = Color(0xFFF7F2EA);
  static const Color lightBottomBackground = Color(0xFFFFFCF7);
  static const Color lightPrimary = Color(0xFF294A3A);
  static const Color lightGray = Color(0xFF7B827A);
  static const Color lightText = Color(0xFF1E2521);
  static const Color lightCardFill = Color(0xFFF5F5F5);
  static const Color lightBorderSide = Color(0xFFE8DDCB);
  static const Color lightProfileCard = Color(0xFFFFFCF7);

  // Dark Palette
  static const Color darkBackground = Color(0xFF121614);
  static const Color darkBottomBackground = Color(0xFF19201C);
  static const Color darkPrimary = Color(0xFF4EA77A);
  static const Color darkGray = Color(0xFF8E9B94);
  static const Color darkText = Color(0xFFF3F6F4);
  static const Color darkCardFill = Color(0xFF202723);
  static const Color darkBorderSide = Color(0xFF2C3831);
  static const Color darkProfileCard = Color(0xFF19201C);

  // Dynamic Getters
  static Color get backgroundClr =>
      isDarkMode ? darkBackground : lightBackground;
  static Color get bottomBackgroundClr =>
      isDarkMode ? darkBottomBackground : lightBottomBackground;
  static Color get primaryClr => isDarkMode ? darkPrimary : lightPrimary;
  static Color get blackClr => isDarkMode ? darkText : Colors.black;
  static Color get grayClr => isDarkMode ? darkGray : lightGray;
  static const Color whiteClr = Colors.white;
  static Color get hintClr => isDarkMode ? darkGray : lightGray;
  static Color get textClr => isDarkMode ? darkText : lightText;
  static const Color redClr = Color(0xFFDC2626);
  static const Color brownClr = Color(0xFFB9785B);
  static const Color brown2Clr = Color(0xFFB9785B);
  static Color get cardFillClr => isDarkMode ? darkCardFill : lightCardFill;
  static Color get borderSideClr =>
      isDarkMode ? darkBorderSide : lightBorderSide;
  static Color get appBarComponentsColor =>
      isDarkMode ? darkText : lightText;
  static Color get profileCard => isDarkMode ? darkProfileCard : lightProfileCard;
}
