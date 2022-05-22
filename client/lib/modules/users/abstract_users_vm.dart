import '../../core/types/view_model.dart';
import '../user/user_model.dart';
import 'users_repository_interface.dart';

abstract class UsersViewModel with ViewModel {
  final IUsersRepository _repository;

  List<UserModel>? _users;

  UsersViewModel(this._repository);

  List<UserModel>? get users => _users;

  Future<void> loadUsers() async {
    _users = await _repository.users();
    notifyListeners();
  }

  bool get usersLoaded => _users != null;
}
