import 'package:flutter/material.dart';

import '../app/app_control.dart';

class OnBoardControl extends StatelessWidget {
  const OnBoardControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const Login(),
    );
    */
    return const AppControl();
  }
}
