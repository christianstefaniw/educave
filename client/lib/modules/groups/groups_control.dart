import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import 'classes/classes_screen.dart';
import 'clubs/clubs_screen.dart';
import 'groups_repository.dart';
import 'groups_service.dart';
import 'my_groups/my_groups_vm.dart';
import 'my_groups/my_groups_screen.dart';
import 'teams/teams_screen.dart';
import 'top_groups/top_groups_screen.dart';
import 'top_groups/top_groups_vm.dart';

class GroupsControl extends StatelessWidget {
  const GroupsControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ChangeNotifierProvider(
          create: (_) => MyGroupsViewModel(
            GroupsService(
              GroupsRepository(ApiProvider()),
            ),
          ),
          child: const MyGroups(),
        ),
        ChangeNotifierProvider(
          create: (_) => TopGroupsViewModel(
            GroupsService(
              GroupsRepository(ApiProvider()),
            ),
          ),
          child: const TopGroups(),
        ),
        const Teams(),
        const Clubs(),
        const Classes(),
      ],
    );
  }
}
