class UserModel {
  final String _profilePic;

  UserModel({required String profilePic}) : _profilePic = profilePic;

  UserModel.fromJson(Map<String, dynamic> json)
      : _profilePic = json['profilePic'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profilePic'] = _profilePic;
    return data;
  }
}
