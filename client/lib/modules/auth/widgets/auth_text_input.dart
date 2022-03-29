import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class AuthTextInput extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController controller;

  const AuthTextInput(
      {required this.hintText,
      required this.errorText,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hintText.toLowerCase() == 'password' ? true : false,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.colors.light,
        hintText: hintText,
        errorText: errorText,
        contentPadding: const EdgeInsets.all(17),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
