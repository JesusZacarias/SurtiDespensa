import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';

/// Define la apariencia compartida por todas las pantallas.
abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffold,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.navy,
        surfaceTintColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColors.hint, fontSize: 17),
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 17,
        ),
        enabledBorder: _outlineBorder(AppColors.border),
        focusedBorder: _outlineBorder(AppColors.primary, width: 1.6),
        errorBorder: _outlineBorder(AppColors.danger),
        focusedErrorBorder: _outlineBorder(AppColors.danger, width: 1.6),
      ),
    );
  }

  /// Centralizar el borde evita repetir la misma forma en todos los campos.
  static OutlineInputBorder _outlineBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

extension ThemeColorsExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
