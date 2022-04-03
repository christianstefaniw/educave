import 'package:client/core/types/controller.dart';

import 'account_model.dart';

class AccountController extends Controller {
  late AccountModel _account;

  AccountModel get account => _account;

  void setAccount(AccountModel account) {
    _account = account;
    notifyListeners();
  }
}
