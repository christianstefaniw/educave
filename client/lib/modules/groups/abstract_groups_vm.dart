import 'package:flutter/foundation.dart';

import '../../core/types/view_model.dart';
import '../group/group_model.dart';
import 'groups_service_interface.dart';

abstract class GroupsViewModel with ViewModel {
  @protected
  final IGroupsService groupsService;

  GroupsViewModel(this.groupsService);

  List<GroupModel>? get groups => groupsService.groups;

  Future<void> loadGroups() async {
    await groupsService.loadGroups();
    notifyListeners();
  }

  bool get groupsLoaded => groups != null;
}
