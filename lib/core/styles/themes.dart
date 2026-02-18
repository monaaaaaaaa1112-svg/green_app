import 'package:flutter/material.dart';
import 'package:green_app/core/styles/colors.dart';
import 'package:green_app/core/constants/fonts.dart';
import 'package:green_app/core/styles/text_style.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        foregroundColor: AppColors.background,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(60, 30),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      // text color
      onSurface: AppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption2,
      fillColor: AppColors.accent,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
