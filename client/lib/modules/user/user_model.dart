import '../group/group_model.dart';
import '../group/mutual_group_model.dart';

class UserModel {
  final String _profilePic;
  final String _username;
  final List<MutualGroupModel> _mutualGroups;

  UserModel(
      {required String profilePic,
      required String username,
      required List<MutualGroupModel> mutualGroups})
      : _profilePic = profilePic,
        _username = username,
        _mutualGroups = mutualGroups;

  UserModel.fromJson(Map<String, dynamic> json)
      : _profilePic = json['profilePic'],
        _username = json['username'],
        _mutualGroups = json['mutualGroups'];

  String get profilePic => _profilePic;
  String get username => _username;
  List<MutualGroupModel> get mutualGroups => _mutualGroups;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profilePic'] = _profilePic;
    data['mutualGroups'] = _mutualGroups;
    data['username'] = _username;
    return data;
  }
}
