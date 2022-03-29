import 'package:client/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String? text;

  const ErrorText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(color: AppTheme.colors.danger),
    );
  }
}
