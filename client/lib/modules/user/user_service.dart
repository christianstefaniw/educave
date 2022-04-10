import 'account_model.dart';

class UserService {
  AccountModel? account;

  void setAccount(AccountModel account) {
    this.account = account;
  }
}
