import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../groups_widget.dart';
import 'teams_vm.dart';

class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Provider.of<TeamsViewModel>(context, listen: false).loadGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final vm = Provider.of<TeamsViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: vm.groupsLoaded ? Groups(vm.groups!) : const Text('loading'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
