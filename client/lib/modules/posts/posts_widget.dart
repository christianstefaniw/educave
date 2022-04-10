import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../post/post_controller.dart';
import '../post/post_model.dart';
import '../post/post_service.dart';
import '../post/post_widget.dart';
import '../stories/story_model.dart';
import '../stories/widgets/preview/stories_preview.dart';

class Posts extends StatelessWidget {
  final List<PostModel> _posts;
  final List<StoryModel>? _stories;
  const Posts(this._posts, {List<StoryModel>? stories, Key? key})
      : _stories = stories,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider(
          create: (context) => PostController(PostService(_posts[index])),
          child: Column(
            children: [
              if (index == 1 && _stories != null) ...[
                StoriesPreview(_stories!),
                const Divider(),
              ],
              const Post(),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
