import 'account_model.dart';
import 'user_service_interface.dart';

class UserService implements IUserService {
  AccountModel? account;

  @override
  void setAccount(AccountModel account) {
    this.account = account;
  }
}
