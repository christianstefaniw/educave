import '../user/user_model.dart';
import 'strategies/fetch_users_strategy.dart';

abstract class IUsersService {
  Future<void> loadUsers();
  List<UserModel>? get users;
  void setFetchUsersStrategy(FetchUsersStrategy strategy);
}
