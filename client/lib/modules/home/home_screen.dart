import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../posts/posts_widget.dart';
import 'home_vm.dart';

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
    Provider.of<HomeViewModel>(context, listen: false).loadPostsAndStories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final viewModel = Provider.of<HomeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SingleChildScrollView(
        child: viewModel.postsAndStoriesLoaded
            ? Posts(
                viewModel.posts!,
                stories: viewModel.stories!,
              )
            : const Text('loading'),
      ),
    );
  }
}
