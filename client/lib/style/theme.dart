import 'package:flutter/cupertino.dart';

class AppThemeData {
  static const inputBackground = Color(0xFFF3F3F3);

  static CupertinoThemeData get theme {
    return const CupertinoThemeData(
      primaryColor: Color(0xFF0d6efd),
      textTheme: CupertinoTextThemeData(
        textStyle:
            TextStyle(fontFamily: 'Poppins', color: CupertinoColors.black),
      ),
    );
  }
}
