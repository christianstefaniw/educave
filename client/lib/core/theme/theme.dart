import 'package:flutter/material.dart';

part 'colors.dart';
part 'text.dart';

abstract class AppTheme {
  static final colors = _AppColors();
  static final text = _Text();

  static ThemeData get globalTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: colors.primary,
        secondary: colors.secondary,
        error: colors.danger,
      ),
      fontFamily: 'Poppins',
    );
  }
}
