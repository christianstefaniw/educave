import '../group/mutual_group_model.dart';

class UserModel {
  final String _profilePic;
  final String _username;
  final List<MutualGroupModel> _mutualGroups;
  bool _isFollowing;

  UserModel({
    required String profilePic,
    required String username,
    required List<MutualGroupModel> mutualGroups,
    required bool isFollowing,
  })  : _profilePic = profilePic,
        _username = username,
        _mutualGroups = mutualGroups,
        _isFollowing = isFollowing;

  UserModel.fromJson(Map<String, dynamic> json)
      : _profilePic = json['profilePic'],
        _username = json['username'],
        _mutualGroups = json['mutualGroups'],
        _isFollowing = json['isFollowing'];

  String get profilePic => _profilePic;
  String get username => _username;
  List<MutualGroupModel> get mutualGroups => _mutualGroups;
  bool get isFollowing => _isFollowing;

  void follow() {
    if (!_isFollowing) _isFollowing = true;
  }

  void unfollow() {
    if (_isFollowing) _isFollowing = false;
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
