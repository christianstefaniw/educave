import '../../account/account_model.dart';

abstract class ILoginRepository {
  Future<AccountModel> login(AccountModel account);
}
