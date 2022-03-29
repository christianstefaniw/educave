import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  final Color? color;
  final void Function()? onPressed;
  final String text;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const CtaButton(
      {required this.onPressed,
      required this.text,
      this.color,
      this.padding,
      this.width,
      this.height,
      this.textStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          padding: padding,
          textStyle: textStyle ??
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
