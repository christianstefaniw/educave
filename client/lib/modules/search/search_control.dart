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
import '../users/all/all_users_screen.dart';

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
        const AllUsers(),
        const Teams(),
        const Clubs(),
        const Classes(),
      ],
    );
  }
}
