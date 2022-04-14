import 'strategies/fetch_users_strategy.dart';
import '../user/user_model.dart';
import 'users_repository_interface.dart';
import 'users_service_interface.dart';

class UsersService implements IUsersService {
  final IUsersRepository _repository;
  List<UserModel>? _users;

  UsersService(this._repository);

  @override
  Future<void> loadUsers() async {
    _users = await _repository.users();
  }

  @override
  void setFetchUsersStrategy(FetchUsersStrategy strategy) {
    _repository.setFetchUsersStrategy(strategy);
  }

  @override
  List<UserModel>? get users => _users;
}
