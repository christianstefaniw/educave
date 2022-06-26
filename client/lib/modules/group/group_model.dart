import 'group_repository_interface.dart';

class GroupModel {
  final String _id;
  final String _name;
  final String _summary;
  final String _groupPic;
  final String _backgroundPic;
  final int _numPosts;
  final IGroupRepository _repository;

  bool _joined;
  int _numMembers;

  GroupModel(this._repository,
      {required String id,
      required String name,
      required String summary,
      required String groupPic,
      required String backgroundPic,
      required bool joined,
      required int numMembers,
      required int numPosts})
      : _id = id,
        _name = name,
        _summary = summary,
        _groupPic = groupPic,
        _backgroundPic = backgroundPic,
        _joined = joined,
        _numMembers = numMembers,
        _numPosts = numPosts;

  String get id => _id;
  String get name => _name;
  String get summary => _summary;
  String get groupPic => _groupPic;
  String get backgroundPic => _backgroundPic;
  bool get joined => _joined;
  int get numMembers => _numMembers;
  int get numPosts => _numPosts;

  void join() async {
    _joined = true;
    _numMembers++;
    await _repository.join();
  }

  void unjoin() async {
    _joined = false;
    _numMembers--;
    await _repository.unjoin();
  }

  GroupModel.fromJson(Map<String, dynamic> json, IGroupRepository repository)
      : _repository = repository,
        _id = json['id'],
        _name = json['name'],
        _summary = json['summary'],
        _groupPic = json['groupPic'],
        _backgroundPic = json['backgroundPic'],
        _joined = json['joined'],
        _numMembers = json['numMembers'],
        _numPosts = json['numPosts'];
}
