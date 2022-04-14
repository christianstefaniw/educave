import '../../user/user_model.dart';
import '../../../data/providers/api_provider_interface.dart';
import 'fetch_users_strategy.dart';

class AllUsers implements FetchUsersStrategy {
  @override
  Future<List<UserModel>> execute(IApiProvider client) async {
    return await Future.delayed(
      const Duration(seconds: 1),
      () => [
        UserModel(
          username: 'Sarah Cameron',
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
        )
      ],
    );
  }
}
