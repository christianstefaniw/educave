import 'account_model.dart';
import 'account_repository_interface.dart';
import 'account_service_interface.dart';

class AccountService implements IAccountService {
  final IAccountRepository _repository;
  AccountModel? _account;

  AccountService(this._repository, [this._account]);

  @override
  String get profilePic => _account!.profilePic;

  @override
  String get id => _account!.id;

  @override
  void setAccount(AccountModel account) {
    _account = account;
  }
}
