import 'package:flutter/material.dart';

import 'account_model.dart';

class AccountController extends ChangeNotifier {
  AccountModel? _account;

  AccountModel? get account => _account;

  void setAccount(AccountModel account) {
    _account = account;
    notifyListeners();
  }
}
