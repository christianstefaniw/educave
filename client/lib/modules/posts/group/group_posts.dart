import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../posts_widget.dart';
import 'group_posts_vm.dart';

class GroupPosts extends StatefulWidget {
  const GroupPosts({Key? key}) : super(key: key);

  @override
  State<GroupPosts> createState() => _GroupPostsState();
}

class _GroupPostsState extends State<GroupPosts> {
  @override
  void initState() {
    Provider.of<GroupPostsViewModel>(context, listen: false)
        .loadPostsAndStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupPostsViewModel>(context);

    return vm.postsAndStoriesLoaded
        ? Posts(
            vm.posts!,
            stories: vm.stories!,
          )
        : const Text('Loading');
  }
}
