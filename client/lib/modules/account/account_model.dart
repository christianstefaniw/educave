class AccountModel {
  final String _email;
  final String _profilePic;

  AccountModel({required String email, required String profilePic})
      : _email = email,
        _profilePic = profilePic;

  AccountModel.fromJson(Map<String, dynamic> json)
      : _email = json['email'],
        _profilePic = json['profilePic'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = _email;
    data['profilePic'] = _profilePic;
    return data;
  }
}
