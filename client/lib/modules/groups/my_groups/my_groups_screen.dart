import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../groups_widget.dart';
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
          ? Groups(viewModel.groups!)
          : const Text('loading'),
    );
  }
}
