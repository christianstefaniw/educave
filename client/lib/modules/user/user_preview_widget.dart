import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_vm.dart';

class UserPreview extends StatelessWidget {
  const UserPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);

    return Text(vm.username);
  }
}
