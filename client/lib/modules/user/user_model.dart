class UserModel {
  final String _profilePic;
  final String _username;

  UserModel({required String profilePic, required String username})
      : _profilePic = profilePic,
        _username = username;

  UserModel.fromJson(Map<String, dynamic> json)
      : _profilePic = json['profilePic'],
        _username = json['username'];

  String get profilePic => _profilePic;
  String get username => _username;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profilePic'] = _profilePic;
    data['username'] = _username;
    return data;
  }
}
