import '../group/mutual_group_model.dart';
import 'user_repository_interface.dart';

class UserModel {
  final IUserRepository _repository;
  final String _profilePic;
  final String _username;
  final List<MutualGroupModel> _mutualGroups;
  bool _isFollowing;

  UserModel(
    this._repository, {
    required String profilePic,
    required String username,
    required List<MutualGroupModel> mutualGroups,
    required bool isFollowing,
  })  : _profilePic = profilePic,
        _username = username,
        _mutualGroups = mutualGroups,
        _isFollowing = isFollowing;

  UserModel.fromJson(Map<String, dynamic> json, IUserRepository repository)
      : _repository = repository,
        _profilePic = json['profilePic'],
        _username = json['username'],
        _mutualGroups = json['mutualGroups'],
        _isFollowing = json['isFollowing'];

  String get profilePic => _profilePic;
  String get username => _username;
  List<MutualGroupModel> get mutualGroups => _mutualGroups;
  bool get isFollowing => _isFollowing;

  void follow() async {
    if (_isFollowing) return;

    _isFollowing = true;
    await _repository.follow();
  }

  void unfollow() async {
    if (!_isFollowing) return;

    _isFollowing = false;
    await _repository.unfollow();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profilePic'] = _profilePic;
    data['mutualGroups'] = _mutualGroups;
    data['username'] = _username;
    data['isFollowing'] = _isFollowing;
    return data;
  }
}
