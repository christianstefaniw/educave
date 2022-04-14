import '../../core/types/view_model.dart';
import 'user_service_interface.dart';

class UserViewModel with ViewModel {
  final IUserService _service;

  UserViewModel(this._service);

  String get username => _service.username;

  String get profilePic => _service.profilePic;
}
