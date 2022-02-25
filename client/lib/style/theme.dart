import 'package:flutter/cupertino.dart';

class AppThemeData {
  static const primaryColor = Color(0xFF0D6EFD);
  static const secondaryColor = Color(0xFF6C757D);
  static const successColor = Color(0xFF198754);
  static const dangerColor = Color(0xFFDC3545);
  static const infoColor = Color(0xFF0DCAF0);
  static const warningColor = Color(0xFFFFC107);
  static const lightColor = Color(0xFFF8F9FA);
  static const darkColor = Color(0xFF198754);

  static CupertinoThemeData get theme {
    return const CupertinoThemeData(
      primaryColor: primaryColor,
      textTheme: CupertinoTextThemeData(
        textStyle:
            TextStyle(fontFamily: 'Poppins', color: CupertinoColors.black),
      ),
    );
  }

  static TextStyle get postTextStyle {
    return const TextStyle();
  }
}
