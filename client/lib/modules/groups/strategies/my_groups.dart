import '../../group/group_model.dart';
import '../../../data/providers/api_provider_interface.dart';
import 'fetch_groups_strategy.dart';

class MyGroups implements FetchGroupsStrategy {
  @override
  Future<List<GroupModel>> execute(IApiProvider client) async {
    print('from my groups');
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        GroupModel(
          id: '1',
          name: 'Coding Club',
          summary: 'Humberside’s coding club. Join to code cool games!',
          numMembers: 43,
          numPosts: 82,
        )
      ],
    );
  }
}