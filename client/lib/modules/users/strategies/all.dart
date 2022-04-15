import '../../group/mutual_group_model.dart';
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
          mutualGroups: [
            MutualGroupModel(id: '2', name: 'Coding Club'),
            MutualGroupModel(id: '3', name: 'Engineering Club')
          ],
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
        ),
        UserModel(
          username: 'Sarah Cameron',
          mutualGroups: [
            MutualGroupModel(id: '2', name: 'Coding Club'),
            MutualGroupModel(id: '3', name: 'Engineering Club')
          ],
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
        ),
        UserModel(
          username: 'Sarah Cameron',
          mutualGroups: [
            MutualGroupModel(id: '2', name: 'Coding Club'),
            MutualGroupModel(id: '3', name: 'Engineering Club')
          ],
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
        ),
        UserModel(
          username: 'Sarah Cameron',
          mutualGroups: [
            MutualGroupModel(id: '2', name: 'Coding Club'),
            MutualGroupModel(id: '3', name: 'Engineering Club')
          ],
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
        )
      ],
    );
  }
}
