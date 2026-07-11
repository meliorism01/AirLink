import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0F1115);
  static const surface = Color(0xFF1A1D24);
  static const primary = Color(0xFF00C2FF);
  static const success = Color(0xFF00D26A);

  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFF9CA3AF);
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
    ),
  );
}