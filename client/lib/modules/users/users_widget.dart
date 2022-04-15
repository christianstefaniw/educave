import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../user/user_model.dart';
import '../user/user_preview_widget.dart';
import '../user/user_repository.dart';
import '../user/user_service.dart';
import '../user/user_vm.dart';

class Users extends StatelessWidget {
  final List<UserModel> _users;
  const Users(this._users, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider(
          create: (_) => UserViewModel(
            UserService(
              UserRepository(ApiProvider()),
              _users[index],
            ),
          ),
          child: const UserPreview(),
        );
      },
    );
  }
}
