import 'package:client/modules/app/app_control.dart';
import 'package:client/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardControl extends StatelessWidget {
  const OnBoardControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const Login(),
    ); */
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: const AppControl(),
    );
  }
}
