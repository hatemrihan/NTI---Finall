import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Manrope",
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      canvasColor: AppColors.lightBackground,
      cardColor: AppColors.lightProfileCard,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        onPrimary: Colors.white,
        surface: AppColors.lightProfileCard,
        onSurface: AppColors.lightText,
        error: AppColors.redClr,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.lightText),
        titleTextStyle: TextStyle(
          fontFamily: "Manrope",
          color: AppColors.lightText,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightProfileCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorderSide,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightBottomBackground,
        hintStyle: const TextStyle(
          fontFamily: "Manrope",
          color: AppColors.lightGray,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lightBorderSide,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lightPrimary,
            width: 1.5,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.lightPrimary;
          }
          return AppColors.lightGray;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.lightPrimary.withValues(alpha: 0.35);
          }
          return AppColors.lightBorderSide;
        }),
      ),
      extensions: const [
        AppColorScheme.light,
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Manrope",
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      canvasColor: AppColors.darkBackground,
      cardColor: AppColors.darkProfileCard,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: Colors.white,
        surface: AppColors.darkProfileCard,
        onSurface: AppColors.darkText,
        error: AppColors.redClr,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.darkText),
        titleTextStyle: TextStyle(
          fontFamily: "Manrope",
          color: AppColors.darkText,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkProfileCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorderSide,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkCardFill,
        hintStyle: const TextStyle(
          fontFamily: "Manrope",
          color: AppColors.darkGray,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.darkBorderSide,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.darkPrimary,
            width: 1.5,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkPrimary;
          }
          return AppColors.darkGray;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkPrimary.withValues(alpha: 0.4);
          }
          return AppColors.darkBorderSide;
        }),
      ),
      extensions: const [
        AppColorScheme.dark,
      ],
    );
  }
}

/// Custom ThemeExtension providing full type-safe design tokens.
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.background,
    required this.bottomBackground,
    required this.primary,
    required this.text,
    required this.gray,
    required this.cardFill,
    required this.borderSide,
    required this.profileCard,
    required this.isDark,
  });

  final Color background;
  final Color bottomBackground;
  final Color primary;
  final Color text;
  final Color gray;
  final Color cardFill;
  final Color borderSide;
  final Color profileCard;
  final bool isDark;

  static const AppColorScheme light = AppColorScheme(
    background: AppColors.lightBackground,
    bottomBackground: AppColors.lightBottomBackground,
    primary: AppColors.lightPrimary,
    text: AppColors.lightText,
    gray: AppColors.lightGray,
    cardFill: AppColors.lightCardFill,
    borderSide: AppColors.lightBorderSide,
    profileCard: AppColors.lightProfileCard,
    isDark: false,
  );

  static const AppColorScheme dark = AppColorScheme(
    background: AppColors.darkBackground,
    bottomBackground: AppColors.darkBottomBackground,
    primary: AppColors.darkPrimary,
    text: AppColors.darkText,
    gray: AppColors.darkGray,
    cardFill: AppColors.darkCardFill,
    borderSide: AppColors.darkBorderSide,
    profileCard: AppColors.darkProfileCard,
    isDark: true,
  );

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? background,
    Color? bottomBackground,
    Color? primary,
    Color? text,
    Color? gray,
    Color? cardFill,
    Color? borderSide,
    Color? profileCard,
    bool? isDark,
  }) {
    return AppColorScheme(
      background: background ?? this.background,
      bottomBackground: bottomBackground ?? this.bottomBackground,
      primary: primary ?? this.primary,
      text: text ?? this.text,
      gray: gray ?? this.gray,
      cardFill: cardFill ?? this.cardFill,
      borderSide: borderSide ?? this.borderSide,
      profileCard: profileCard ?? this.profileCard,
      isDark: isDark ?? this.isDark,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      background: Color.lerp(background, other.background, t)!,
      bottomBackground:
          Color.lerp(bottomBackground, other.bottomBackground, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      text: Color.lerp(text, other.text, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      cardFill: Color.lerp(cardFill, other.cardFill, t)!,
      borderSide: Color.lerp(borderSide, other.borderSide, t)!,
      profileCard: Color.lerp(profileCard, other.profileCard, t)!,
      isDark: t < 0.5 ? isDark : other.isDark,
    );
  }
}

extension AppThemeContextExtension on BuildContext {
  AppColorScheme get colors =>
      Theme.of(this).extension<AppColorScheme>() ?? AppColorScheme.light;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
