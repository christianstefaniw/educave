import '../../core/types/controller.dart';
import 'account_model.dart';
import 'user_service.dart';
import 'user_service_interface.dart';

class UserController with Controller {
  final IUserService _service;

  UserController(this._service);

  void setAccount(AccountModel account) {
    _service.setAccount(account);
    notifyListeners();
  }
}
