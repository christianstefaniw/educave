import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../groups_widget.dart';
import 'clubs_vm.dart';

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Provider.of<ClubsViewModel>(context, listen: false).loadGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final vm = Provider.of<ClubsViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: vm.groupsLoaded ? Groups(vm.groups!) : const Text('loading'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
