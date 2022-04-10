import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../posts/posts_widget.dart';
import 'home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final controller = Provider.of<HomeController>(context);
    controller.loadPostsAndStories();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SingleChildScrollView(
        child: controller.postsAndStoriesLoaded
            ? Posts(
                controller.posts!,
                stories: controller.stories!,
              )
            : const Text('loading'),
      ),
    );
  }
}
