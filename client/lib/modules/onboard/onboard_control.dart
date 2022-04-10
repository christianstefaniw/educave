import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../app/app_control.dart';
import '../auth/login/login_controller.dart';
import '../auth/login/login_repository.dart';
import '../auth/login/login_screen.dart';
import '../auth/login/login_service.dart';
import '../home/home_controller.dart';
import '../home/home_service.dart';
import '../posts/posts_repository.dart';
import '../stories/stories_repository.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(
            HomeService(
              PostsRepository(client: ApiProvider()),
              StoriesRepository(client: ApiProvider()),
            ),
          ),
        ),
      ],
      child: const AppControl(),
    );
  }
}
