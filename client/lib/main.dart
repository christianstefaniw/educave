import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'data/providers/api_provider.dart';
import 'modules/user/user_controller.dart';
import 'modules/user/user_repository.dart';
import 'modules/user/user_service.dart';
import 'routes/routes.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
          create: (_) => UserController(
            UserService(UserRepository(ApiProvider())),
          ),
        )
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
