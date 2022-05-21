import 'account_model.dart';

abstract class IAccountService {
  String get profilePic;
  String get id;

  void setAccount(AccountModel account);
}
