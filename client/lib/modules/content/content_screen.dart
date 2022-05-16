import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../post/post_repository.dart';
import '../post/post_service.dart';
import '../post/post_vm.dart';
import '../post/post_widget.dart';
import '../posts/abstract_posts_vm.dart';
import '../stories/widgets/stories_preview.dart';

class Content extends StatefulWidget {
  final Widget? leading;
  const Content({this.leading, Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  void initState() {
    Provider.of<PostsViewModel>(context, listen: false).loadPosts();
    super.initState();
  }

  Widget preLoadStories(BuildContext context) {
    return const StoriesPreview();
  }

  @override
  Widget build(BuildContext context) {
    final postsVm = Provider.of<PostsViewModel>(context);
    final stories = preLoadStories(context);

    if (postsVm.postsLoaded) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: postsVm.posts!.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                if (widget.leading != null && index == 0) ...[
                  widget.leading!,
                ],
                if (index == 1) ...[
                  stories,
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
                  stories,
                  const Divider(),
                ],
              ],
            ),
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
