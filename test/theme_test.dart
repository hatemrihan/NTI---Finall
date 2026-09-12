import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_theme.dart';
import 'package:final_project/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Theme System Tests', () {
    test('Initial theme is light mode and AppColors matches light palette', () {
      final cubit = ThemeCubit();
      expect(cubit.state, ThemeMode.light);
      expect(cubit.isDark, false);
      expect(AppColors.isDarkMode, false);
      expect(AppColors.backgroundClr, AppColors.lightBackground);
      expect(AppColors.primaryClr, AppColors.lightPrimary);
      expect(AppColors.textClr, AppColors.lightText);
    });

    test('Toggling theme switches between light and dark mode', () async {
      final cubit = ThemeCubit();
      await cubit.toggleTheme();

      expect(cubit.state, ThemeMode.dark);
      expect(cubit.isDark, true);
      expect(AppColors.isDarkMode, true);
      expect(AppColors.backgroundClr, AppColors.darkBackground);
      expect(AppColors.primaryClr, AppColors.darkPrimary);
      expect(AppColors.textClr, AppColors.darkText);
      expect(AppColors.profileCard, AppColors.darkProfileCard);
      expect(AppColors.borderSideClr, AppColors.darkBorderSide);

      await cubit.toggleTheme();
      expect(cubit.state, ThemeMode.light);
      expect(cubit.isDark, false);
      expect(AppColors.isDarkMode, false);
      expect(AppColors.backgroundClr, AppColors.lightBackground);
    });

    test('ThemeData is valid for both light and dark modes', () {
      final light = AppTheme.lightTheme;
      final dark = AppTheme.darkTheme;

      expect(light.brightness, Brightness.light);
      expect(dark.brightness, Brightness.dark);

      expect(light.scaffoldBackgroundColor, AppColors.lightBackground);
      expect(dark.scaffoldBackgroundColor, AppColors.darkBackground);

      expect(light.colorScheme.primary, AppColors.lightPrimary);
      expect(dark.colorScheme.primary, AppColors.darkPrimary);
    });
  });
}
