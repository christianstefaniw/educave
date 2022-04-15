import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_service.dart';
import '../posts/recent/recent_posts.dart';
import '../posts/recent/recent_posts_vm.dart';
import '../stories/stories_repository.dart';
import '../stories/stories_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: ChangeNotifierProvider(
        create: (_) => RecentPostsViewModel(
          PostsService(
            PostsRepository(
              ApiProvider(),
            ),
          ),
          StoriesService(
            StoriesRepository(
              ApiProvider(),
            ),
          ),
        ),
        child: const RecentPosts(),
      ),
    );
  }
}
