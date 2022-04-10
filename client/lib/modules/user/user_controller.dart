import '../../core/types/controller.dart';
import 'account_model.dart';
import 'user_service.dart';

class UserController with Controller {
  final UserService _service;
  UserController(this._service);

  void setAccount(AccountModel account) {
    _service.setAccount(account);
    notifyListeners();
  }
}
