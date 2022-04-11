import '../../data/providers/api_provider.dart';
import 'account_model.dart';
import 'user_repository.dart';
import 'user_repository_interface.dart';
import 'user_service_interface.dart';

class UserService implements IUserService {
  final IUserRepository _repository;
  AccountModel? account;

  UserService(this._repository);

  @override
  void setAccount(AccountModel account) {
    this.account = account;
  }
}