import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../groups_widget.dart';
import 'classes_vm.dart';

class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Provider.of<ClassesViewModel>(context, listen: false).loadGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final vm = Provider.of<ClassesViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: vm.groupsLoaded ? Groups(vm.groups!) : const Text('loading'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
