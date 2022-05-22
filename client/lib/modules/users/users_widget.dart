import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../user/user_preview_widget.dart';
import '../user/user_repository.dart';
import '../user/user_vm.dart';
import 'abstract_users_vm.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    Provider.of<UsersViewModel>(context, listen: false).loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UsersViewModel>(context);

    if (vm.usersLoaded) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: vm.users!.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider(
              create: (_) => UserViewModel(
                UserRepository(ApiProvider()),
                vm.users![index],
              ),
              child: Column(
                children: const [
                  UserPreview(),
                  Divider(),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
