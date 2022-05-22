import '../../core/types/view_model.dart';
import '../group/mutual_group_model.dart';
import 'user_model.dart';
import 'user_repository_interface.dart';

class UserViewModel with ViewModel {
  final IUserRepository _repository;
  final UserModel _model;

  UserViewModel(this._repository, this._model);

  String get username => _model.username;
  String get profilePic => _model.profilePic;
  List<MutualGroupModel> get mutualGroups => _model.mutualGroups;
  bool get isFollowing => _model.isFollowing;

  void follow() {
    _repository.follow();
    _model.follow();
    notifyListeners();
  }

  void unfollow() {
    _repository.unfollow();
    _model.follow();
    notifyListeners();
  }
}
