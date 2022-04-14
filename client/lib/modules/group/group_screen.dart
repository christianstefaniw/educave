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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: vm.join, child: Text('ok')),
            Container(
              child: Text(vm.name),
            ),
          ],
        ),
      ),
    );
  }
}
