import '../../account/account_model.dart';

abstract class ILoginService {
  Map<String, String?> get validationErrors;

  bool validate(String email, String password);

  Future<AccountModel?> login(String email, String password);
}
