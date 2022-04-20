import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../post/post_repository.dart';
import '../post/post_service.dart';
import '../post/post_vm.dart';
import '../post/post_widget.dart';
import '../posts/vms/abstract_posts_vm.dart';
import '../stories/widgets/stories_preview.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  void initState() {
    Provider.of<PostsViewModel>(context, listen: false).loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postsVm = Provider.of<PostsViewModel>(context);

    if (postsVm.postsLoaded) {
      return ListView.builder(
        itemCount: postsVm.posts!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 1) ...[
                const StoriesPreview(),
                const Divider(),
              ],
              ChangeNotifierProvider(
                create: (_) => PostViewModel(
                  PostService(
                    postsVm.posts![index],
                    PostRepository(
                      ApiProvider(),
                      postsVm.posts![index].id,
                    ),
                  ),
                ),
                child: const Post(),
              ),
              const Divider(),
              if (postsVm.posts!.length == 1) ...[
                const StoriesPreview(),
                const Divider(),
              ],
            ],
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
