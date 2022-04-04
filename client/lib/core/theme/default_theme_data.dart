import 'package:client/core/theme/text.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeData = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.danger,
  ),
  textTheme: TextTheme(
    headline1: const TextStyle(fontSize: 42).merge(AppTextTheme.headingStyle),
    headline3: const TextStyle(fontSize: 34).merge(AppTextTheme.headingStyle),
  ),
  fontFamily: 'Poppins',
);
