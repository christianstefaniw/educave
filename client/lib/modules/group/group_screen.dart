import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../../widgets/safearea.dart';
import '../content/content_screen.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_service.dart';
import '../posts/posts_widget.dart';
import '../posts/vms/abstract_posts_vm.dart';
import '../posts/vms/group_posts_vm.dart';
import '../stories/abstract_stories_vm.dart';
import '../stories/stories_repository.dart';
import '../stories/stories_service.dart';
import '../stories/vms/group_stories.dart';
import 'group_vm.dart';
import 'widgets/group_info.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupViewModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<StoriesViewModel>(
            create: (_) => GroupStoriesViewModel(
              vm.id,
              StoriesService(
                StoriesRepository(
                  ApiProvider(),
                ),
              ),
            ),
          ),
          ChangeNotifierProvider<PostsViewModel>(
            create: (_) => GroupPostsViewModel(
              vm.id,
              PostsService(
                PostsRepository(
                  ApiProvider(),
                ),
              ),
            ),
          ),
        ],
        child: const Content(leading: GroupInfo()),
      ),
    );
  }
}
