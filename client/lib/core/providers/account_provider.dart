import 'package:flutter/cupertino.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel? _account;

  AccountModel? get account => _account;

  void setAccount(AccountModel account) {
    _account = account;
    notifyListeners();
  }
}
