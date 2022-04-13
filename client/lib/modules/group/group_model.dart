class GroupModel {
  final String _id;
  final String _name;
  final String _summary;
  final String _groupPic;
  bool _joined;
  int _numMembers;
  final int _numPosts;

  GroupModel(
      {required String id,
      required String name,
      required String summary,
      required String groupPic,
      required bool joined,
      required int numMembers,
      required int numPosts})
      : _id = id,
        _name = name,
        _summary = summary,
        _groupPic = groupPic,
        _joined = joined,
        _numMembers = numMembers,
        _numPosts = numPosts;

  String get id => _id;
  String get name => _name;
  String get summary => _summary;
  String get groupPic => _groupPic;
  bool get joined => _joined;
  int get numMembers => _numMembers;
  int get numPosts => _numPosts;

  void join() {
    _joined = true;
    _numMembers++;
  }

  void unjoin() {
    _joined = false;
    _numMembers--;
  }

  GroupModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _summary = json['summary'],
        _groupPic = json['groupPic'],
        _joined = json['joined'],
        _numMembers = json['numMembers'],
        _numPosts = json['numPosts'];
}
