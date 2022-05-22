import '../../core/validators/validators.dart';

class AccountModel {
  final String _email;
  final String _profilePic;
  final String _id;
  final String _firstName;
  final String _lastName;

  AccountModel(
      {required String id,
      required String email,
      required String profilePic,
      required String firstName,
      required String lastName})
      : _id = id,
        _email = email,
        _profilePic = profilePic,
        _firstName = firstName,
        _lastName = lastName;

  String get profilePic => _profilePic;
  String get id => _id;
  String get name => '$_firstName $_lastName';

  factory AccountModel.create(String email, String password) {
    Map<String, String> validationErrors = {};

    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);

    if (emailError != null) validationErrors['email'] = emailError;
    if (passwordError != null) validationErrors['password'] = passwordError;

    if (validationErrors.isNotEmpty) throw validationErrors;

    return AccountModel(
      id: '1',
      email: email,
      firstName: 'Christian',
      lastName: 'Stefaniw',
      profilePic:
          'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
    );
  }

  AccountModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _email = json['email'],
        _profilePic = json['profilePic'],
        _firstName = json['firstName'],
        _lastName = json['lastName'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = _email;
    data['profilePic'] = _profilePic;
    return data;
  }
}
