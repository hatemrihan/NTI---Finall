import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    loadTheme();
  }

  static const String _prefKey = 'is_dark_mode';

  bool get isDark => state == ThemeMode.dark;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkSaved = prefs.getBool(_prefKey) ?? false;
    AppColors.isDarkMode = isDarkSaved;
    emit(isDarkSaved ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme() async {
    final nextMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final isDarkNext = nextMode == ThemeMode.dark;
    AppColors.isDarkMode = isDarkNext;
    emit(nextMode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, isDarkNext);
  }

  Future<void> setDarkMode(bool isDark) async {
    if (isDark == (state == ThemeMode.dark)) return;
    AppColors.isDarkMode = isDark;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, isDark);
  }
}
