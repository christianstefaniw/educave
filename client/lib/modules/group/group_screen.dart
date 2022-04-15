import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../../widgets/safearea.dart';
import '../posts/group/group_posts.dart';
import '../posts/group/group_posts_vm.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_service.dart';
import '../stories/stories_repository.dart';
import '../stories/stories_service.dart';
import 'group_vm.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupViewModel>(context);

    return MySafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            ChangeNotifierProvider(
              create: (_) => GroupPostsViewModel(
                vm.id,
                PostsService(
                  PostsRepository(
                    ApiProvider(),
                  ),
                ),
                StoriesService(
                  StoriesRepository(
                    ApiProvider(),
                  ),
                ),
              ),
              child: const GroupPosts(),
            ),
          ],
        ),
      ),
    );
  }
}
