import '../group/group_model.dart';

abstract class IGroupsService {
  Future<void> loadGroups();

  List<GroupModel>? get groups;
}
