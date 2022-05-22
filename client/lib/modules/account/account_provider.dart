import 'package:flutter/foundation.dart';

import 'account_model.dart';

class AccountProvider with ChangeNotifier {
  AccountModel? _account;

  String get profilePic => _account!.profilePic;
  String get id => _account!.id;
  String get name => _account!.name;

  void setAccount(AccountModel account) {
    _account = account;
  }
}
