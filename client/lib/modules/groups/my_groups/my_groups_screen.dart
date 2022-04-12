import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../group/group_widget.dart';
import 'my_groups_vm.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MyGroupsViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: viewModel.groupsLoaded
          ? ListView.builder(
              itemCount: viewModel.groups!.length,
              itemBuilder: ((context, index) {
                return Group(viewModel.groups![index]);
              }),
            )
          : const Text('loading'),
    );
  }
}
