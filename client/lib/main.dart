import 'package:client/screens/auth/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0D6EFD),
        fontFamily: 'Poppins',
      ),
      home: Container(
        color: Colors.white,
        child: const SafeArea(
          child: Login(),
        ),
      ),
    );
  }
}
