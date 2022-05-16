import 'group_model.dart';
import 'group_repository_interface.dart';
import 'group_service_interface.dart';

class GroupService implements IGroupService {
  final IGroupRepository _repository;
  final GroupModel _model;

  GroupService(this._model, this._repository);

  @override
  Future<void> join() async {
    _model.join();
    await _repository.join();
  }

  @override
  Future<void> unjoin() async {
    _model.unjoin();
    await _repository.unjoin();
  }

  @override
  Future<void> delete() async {}

  @override
  String get id => _model.id;

  @override
  String get groupPic => _model.groupPic;

  @override
  String get backgroundPic => _model.backgroundPic;

  @override
  String get name => _model.name;

  @override
  String get summary => _model.summary;

  @override
  int get numMembers => _model.numMembers;

  @override
  int get numPosts => _model.numPosts;

  @override
  bool get joined => _model.joined;
}
