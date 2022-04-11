import '../group/group_model.dart';
import 'strategies/fetch_groups_strategy.dart';

abstract class IGroupsService {
  Future<void> loadGroups();

  List<GroupModel>? get groups;

  void setFetchGroupsStrategy(FetchGroupsStrategy strategy);
}
