import 'package:flutter/material.dart';
import 'package:green_app/core/styles/colors.dart';
import 'package:green_app/core/constants/fonts.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: ColorApp.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorApp.primary,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        foregroundColor: ColorApp.background,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(60, 30),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.primary,
      // text color
      onSurface: ColorApp.black,
    ),
  );
}
