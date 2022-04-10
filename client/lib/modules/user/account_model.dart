class AccountModel {
  final String _email;

  AccountModel({required String email}) : _email = email;

  AccountModel.fromJson(Map<String, dynamic> json) : _email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = _email;
    return data;
  }
}
