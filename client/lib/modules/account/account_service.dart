import 'account_model.dart';
import 'account_repository_interface.dart';
import 'account_service_interface.dart';

class AccountService implements IAccountService {
  final IAccountRepository _repository;
  AccountModel? account;

  AccountService(this._repository);

  @override
  void setAccount(AccountModel account) {
    this.account = account;
  }
}
