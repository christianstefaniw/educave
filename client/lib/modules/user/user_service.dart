import 'user_model.dart';
import 'user_repository_interface.dart';
import 'user_service_interface.dart';

class UserService implements IUserService {
  final IUserRepository _repository;
  final UserModel _model;

  UserService(this._repository, this._model);

  @override
  String get username => _model.username;

  @override
  String get profilePic => _model.profilePic;

  @override
  Future<void> follow() async {}

  @override
  Future<void> unfollow() async {}
}
