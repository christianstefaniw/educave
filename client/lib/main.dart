import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'routes/routes.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes.routes;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.globalTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.names.onBoard,
    );
  }
}
