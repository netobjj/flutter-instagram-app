import 'package:flutter/material.dart';
import 'package:instagram/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData construir() {
    final esquema = ColorScheme.fromSeed(
      seedColor: AppColors.primaria,
      primary: AppColors.primaria,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      scaffoldBackgroundColor: Colors.white,

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaria,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primariaFraca,
          disabledForegroundColor: Colors.white,
          minimumSize: const Size.fromHeight(44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.fundoCampo,
        border: OutlineInputBorder(),
        hintStyle: TextStyle(color: AppColors.textoApagado),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
