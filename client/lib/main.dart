import 'package:client/modules/account/account_controller.dart';
import 'package:client/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountController>(
            create: (_) => AccountController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routes: appRoutes,
        initialRoute: AppRouteNames.onBoard,
      ),
    );
  }
}
