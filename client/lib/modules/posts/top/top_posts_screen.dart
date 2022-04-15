import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../posts_widget.dart';
import 'top_posts_vm.dart';

class TopPosts extends StatefulWidget {
  const TopPosts({Key? key}) : super(key: key);

  @override
  State<TopPosts> createState() => _TopPostsState();
}

class _TopPostsState extends State<TopPosts>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Provider.of<TopPostsViewModel>(context, listen: false).loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final vm = Provider.of<TopPostsViewModel>(context);

    return vm.postsLoaded
        ? SingleChildScrollView(child: Posts(vm.posts!))
        : const Text('loading');
  }

  @override
  bool get wantKeepAlive => true;
}
