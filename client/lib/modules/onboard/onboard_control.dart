import 'package:client/modules/app/app_control.dart';
import 'package:flutter/material.dart';

class OnBoardControl extends StatelessWidget {
  const OnBoardControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const Login(),
    ); */
    return const AppControl();
  }
}
