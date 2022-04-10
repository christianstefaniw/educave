import 'group_model.dart';
import 'group_repository_interface.dart';
import 'group_service_interface.dart';

class GroupService implements IGroupService {
  final IGroupRepository _repository;
  final GroupModel _model;

  GroupService(this._repository, this._model);

  @override
  Future<void> joinGroup() async {
    await _repository.joinGroup();
  }
}
