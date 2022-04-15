import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../groups/classes/classes_screen.dart';
import '../groups/clubs/clubs_screen.dart';
import '../groups/groups_repository.dart';
import '../groups/groups_service.dart';
import '../groups/teams/teams_screen.dart';
import '../groups/top_groups/top_groups_screen.dart';
import '../groups/top_groups/top_groups_vm.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_service.dart';
import '../posts/top/top_posts_screen.dart';
import '../posts/top/top_posts_vm.dart';
import '../users/all/all_users_screen.dart';
import '../users/all/all_users_vm.dart';
import '../users/users_repository.dart';
import '../users/users_service.dart';

class SearchControl extends StatelessWidget {
  const SearchControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ChangeNotifierProvider(
          create: (_) => TopGroupsViewModel(
            GroupsService(
              GroupsRepository(ApiProvider()),
            ),
          ),
          child: const TopGroups(),
        ),
        ChangeNotifierProvider(
          create: (_) => TopPostsViewModel(
            PostsService(
              PostsRepository(
                ApiProvider(),
              ),
            ),
          ),
          child: const TopPosts(),
        ),
        ChangeNotifierProvider(
          create: (_) => AllUsersViewModel(
            UsersService(
              UsersRepository(
                ApiProvider(),
              ),
            ),
          ),
          child: const AllUsers(),
        ),
        const Teams(),
        const Clubs(),
        const Classes(),
      ],
    );
  }
}
