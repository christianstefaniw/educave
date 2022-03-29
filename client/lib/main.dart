import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'routes/routes.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globalTheme,
      routes: appRoutes,
      initialRoute: AppRouteNames.onBoard,
    );
  }
}
