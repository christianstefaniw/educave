import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/api_provider.dart';
import '../../group/group_repository.dart';
import '../../group/group_service.dart';
import '../../group/group_vm.dart';
import '../../group/group_preview_widget.dart';
import '../../posts/posts_repository.dart';
import '../../posts/posts_service.dart';
import '../../stories/stories_repository.dart';
import '../../stories/stories_service.dart';
import 'my_groups_vm.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  State<MyGroups> createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Provider.of<MyGroupsViewModel>(context, listen: false).loadGroups();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = Provider.of<MyGroupsViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: viewModel.groupsLoaded
          ? ListView.builder(
              itemCount: viewModel.groups!.length,
              itemBuilder: ((context, index) {
                return ChangeNotifierProvider(
                  create: (_) => GroupViewModel(
                    GroupService(
                      viewModel.groups![index],
                      GroupRepository(ApiProvider(),
                          groupId: viewModel.groups![index].id),
                    ),
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
                  child: const GroupPreview(),
                );
              }),
            )
          : const Text('loading'),
    );
  }
}
