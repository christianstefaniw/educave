import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../app/app_control.dart';
import '../home/home_controller.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_service.dart';
import '../posts/strategies/from_recent.dart' as fetch_posts;
import '../stories/stories_repository.dart';
import '../stories/stories_service.dart';
import '../stories/strategies/from_recent.dart' as fetch_stories;

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
            PostsService(
              PostsRepository(
                ApiProvider(),
                fetchStrategy: fetch_posts.FromRecent(),
              ),
            ),
            StoriesService(
              StoriesRepository(
                ApiProvider(),
                fetchStrategy: fetch_stories.FromRecent(),
              ),
            ),
          ),
        ),
      ],
      child: const AppControl(),
    );
  }
}
