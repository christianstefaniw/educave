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
  late HomeController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<HomeController>(context);
    _controller.loadPostsAndStories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SingleChildScrollView(
        child: _controller.postsAndStoriesLoaded
            ? Posts(
                _controller.posts!,
                stories: _controller.stories!,
              )
            : const Text('loading'),
      ),
    );
  }
}
