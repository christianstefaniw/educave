class AccountModel {
  final String _email;
  final String _profilePic;
  final String _id;

  AccountModel(
      {required String id, required String email, required String profilePic})
      : _id = id,
        _email = email,
        _profilePic = profilePic;

  String get profilePic => _profilePic;
  String get id => _id;

  AccountModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _email = json['email'],
        _profilePic = json['profilePic'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = _email;
    data['profilePic'] = _profilePic;
    return data;
  }
}
