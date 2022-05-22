import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../group/group_preview_widget.dart';
import '../group/group_repository.dart';
import '../group/group_vm.dart';
import 'abstract_groups_vm.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  void initState() {
    Provider.of<GroupsViewModel>(context, listen: false).loadGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupsViewModel>(context);

    if (vm.groupsLoaded) {
      return ListView.builder(
        itemCount: vm.groups!.length,
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider(
            create: (_) => GroupViewModel(
              GroupRepository(ApiProvider()),
              vm.groups![index],
            ),
            child: const GroupPreview(),
          );
        }),
      );
    } else {
      return const SizedBox();
    }
  }
}
