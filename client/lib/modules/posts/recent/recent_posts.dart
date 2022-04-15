import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../posts_widget.dart';
import 'recent_posts_vm.dart';

class RecentPosts extends StatefulWidget {
  const RecentPosts({Key? key}) : super(key: key);

  @override
  State<RecentPosts> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<RecentPosts> {
  @override
  void initState() {
    Provider.of<RecentPostsViewModel>(context, listen: false)
        .loadPostsAndStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecentPostsViewModel>(context);

    return viewModel.postsAndStoriesLoaded
        ? SingleChildScrollView(
            child: Posts(
              viewModel.posts!,
              stories: viewModel.stories!,
            ),
          )
        : const Text('loading');
  }
}
