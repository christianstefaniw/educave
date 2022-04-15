import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../users_widget.dart';
import 'all_users_vm.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Provider.of<AllUsersViewModel>(context, listen: false).loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final vm = Provider.of<AllUsersViewModel>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: vm.usersLoaded ? Users(vm.users!) : const Text('loading'));
  }

  @override
  bool get wantKeepAlive => true;
}
