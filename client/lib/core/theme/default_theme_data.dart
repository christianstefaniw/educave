import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeData = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.danger,
  ),
  fontFamily: 'Poppins',
);