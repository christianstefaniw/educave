import 'package:client/screens/auth/login/login.dart';
import 'package:client/style/theme.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.theme,
      home: Container(
        color: CupertinoColors.white,
        child: const SafeArea(
          child: Login(),
        ),
      ),
    );
  }
}
