import 'package:flutter/material.dart';

import '../app/app_control.dart';

class OnBoardControl extends StatelessWidget {
  const OnBoardControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return ChangeNotifierProvider(
      create: (_) => LoginController(
        LoginService(LoginRepository(client: ApiProvider())),
      ),
      child: const Login(),
    );
    */
    return const AppControl();
  }
}
