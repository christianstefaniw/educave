import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/login/login_controller.dart';
import '../auth/login/login_page.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const Login(),
    );
  }
}
