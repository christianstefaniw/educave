import '../../group/group_model.dart';
import '../../../data/providers/api_provider_interface.dart';
import 'fetch_groups_strategy.dart';

class MyGroups implements FetchGroupsStrategy {
  @override
  Future<List<GroupModel>> execute(IApiProvider client) async {
    print('from my groups');
    return await Future.delayed(
      const Duration(seconds: 1),
      () => [
        GroupModel(
          id: '1',
          name: 'Humberside Collegiate Institute',
          summary:
              'The official Educave room for Humberside Collegiate Institute',
          groupPic:
              'https://schoolweb.tdsb.on.ca/portals/humbersideci/images/crest03.gif',
          numMembers: 43,
          numPosts: 82,
        ),
        GroupModel(
          id: '1',
          name: 'Coding Club',
          summary:
              'The official Educave room for Humberside Collegiate Institute',
          groupPic:
              'https://i.pinimg.com/originals/0f/8b/28/0f8b2870896edcde8f6149fe2733faaf.jpg',
          numMembers: 43,
          numPosts: 82,
        ),
      ],
    );
  }
}
