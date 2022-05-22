import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../post/post_repository.dart';
import '../post/post_vm.dart';
import '../post/post_widget.dart';
import 'abstract_posts_vm.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    Provider.of<PostsViewModel>(context, listen: false).loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PostsViewModel>(context);

    if (vm.postsLoaded) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: vm.posts!.length,
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider(
            create: (_) => PostViewModel(
              PostRepository(
                ApiProvider(),
                vm.posts![index].id,
              ),
              vm.posts![index],
            ),
            child: Column(
              children: const [
                Post(),
                Divider(),
              ],
            ),
          );
        }),
      );
    } else {
      return const SizedBox();
    }
  }
}
