import 'package:client/core/theme/theme.dart';
import 'package:client/modules/auth/login/login_binding.dart';
import 'package:client/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.globalTheme,
      initialBinding: LoginBindings(),
      getPages: AppPages.pages,
    );
  }
}
