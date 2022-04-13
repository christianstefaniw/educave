import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/safearea.dart';
import 'group_vm.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupViewModel>(context);
    return MySafeArea(
      child: Scaffold(
        body: Container(
          child: Text(vm.name),
        ),
      ),
    );
  }
}