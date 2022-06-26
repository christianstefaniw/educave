import '../../core/types/view_model.dart';
import '../user/user_model.dart';
import 'users_model.dart';

class UsersViewModel with ViewModel {
  final UsersModel _model;

  UsersViewModel(this._model) {
    _loadUsers();
  }

  List<UserModel>? get users => _model.users;
  bool get usersLoaded => _model.users != null;

  Future<void> _loadUsers() async {
    await _model.loadUsers();
    notifyListeners();
  }
}
