import '../../core/types/view_model.dart';
import 'account_model.dart';
import 'user_service_interface.dart';

class UserViewModel with ViewModel {
  final IUserService _service;

  UserViewModel(this._service);

  void setAccount(AccountModel account) {
    _service.setAccount(account);
    notifyListeners();
  }
}
