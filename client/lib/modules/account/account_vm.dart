import '../../core/types/view_model.dart';
import 'account_model.dart';
import 'account_service_interface.dart';

class AccountViewModel with ViewModel {
  final IAccountService _service;

  AccountViewModel(this._service);

  void setAccount(AccountModel account) {
    _service.setAccount(account);
    notifyListeners();
  }

  String get id => _service.id;

  String get profilePic => _service.profilePic;
}
