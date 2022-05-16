import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../../widgets/persistent_tab.dart';
import '../groups/abstract_groups_vm.dart';
import '../groups/groups_widget.dart';
import '../groups/vms/classes_vm.dart';
import '../groups/vms/clubs_vm.dart';
import '../groups/groups_repository.dart';
import '../groups/groups_service.dart';
import '../groups/vms/teams_vm.dart';
import '../groups/vms/top_groups_vm.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_service.dart';
import '../posts/posts_widget.dart';
import '../posts/abstract_posts_vm.dart';
import '../posts/vms/top_posts_vm.dart';
import '../users/abstract_users_vm.dart';
import '../users/users_widget.dart';
import '../users/vms/all_users_vm.dart';
import '../users/users_repository.dart';
import '../users/users_service.dart';

class SearchControl extends StatelessWidget {
  const SearchControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        PersistentTab(
          child: ChangeNotifierProvider<GroupsViewModel>(
            create: (_) => TopGroupsViewModel(
              GroupsService(
                GroupsRepository(
                  ApiProvider(),
                ),
              ),
            ),
            child: const Groups(),
          ),
        ),
        PersistentTab(
          child: ChangeNotifierProvider<PostsViewModel>(
            create: (_) => TopPostsViewModel(
              PostsService(
                PostsRepository(
                  ApiProvider(),
                ),
              ),
            ),
            child: const Posts(),
          ),
        ),
        PersistentTab(
          child: ChangeNotifierProvider<UsersViewModel>(
            create: (_) => AllUsersViewModel(
              UsersService(
                UsersRepository(
                  ApiProvider(),
                ),
              ),
            ),
            child: const Users(),
          ),
        ),
        PersistentTab(
          child: ChangeNotifierProvider<GroupsViewModel>(
            create: (_) => TeamsViewModel(
              GroupsService(
                GroupsRepository(
                  ApiProvider(),
                ),
              ),
            ),
            child: const Groups(),
          ),
        ),
        PersistentTab(
          child: ChangeNotifierProvider<GroupsViewModel>(
            create: (_) => ClubsViewModel(
              GroupsService(
                GroupsRepository(
                  ApiProvider(),
                ),
              ),
            ),
            child: const Groups(),
          ),
        ),
        PersistentTab(
          child: ChangeNotifierProvider<GroupsViewModel>(
            create: (_) => ClassesViewModel(
              GroupsService(
                GroupsRepository(
                  ApiProvider(),
                ),
              ),
            ),
            child: const Groups(),
          ),
        ),
      ],
    );
  }
}
