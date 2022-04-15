import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../groups_widget.dart';
import 'top_groups_vm.dart';

class TopGroups extends StatefulWidget {
  const TopGroups({Key? key}) : super(key: key);

  @override
  State<TopGroups> createState() => _TopGroupsState();
}

class _TopGroupsState extends State<TopGroups>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Provider.of<TopGroupsViewModel>(context, listen: false).loadGroups();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = Provider.of<TopGroupsViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: viewModel.groupsLoaded
          ? Groups(viewModel.groups!)
          : const Text('loading'),
    );
  }
}
