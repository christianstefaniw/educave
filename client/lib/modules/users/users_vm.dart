import 'package:flutter/foundation.dart';

import '../../core/types/view_model.dart';
import '../user/user_model.dart';
import 'users_service_interface.dart';

abstract class UsersViewModel with ViewModel {
  @protected
  final IUsersService usersService;

  UsersViewModel(this.usersService);

  List<UserModel>? get users => usersService.users;

  Future<void> loadUsers() async {
    await usersService.loadUsers();
    notifyListeners();
  }

  bool get usersLoaded => users != null;
}
