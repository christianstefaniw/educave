class GroupModel {
  final String _id;
  final String _name;
  final String _summary;
  int _numMembers;
  final int _numPosts;

  GroupModel(
      {required String id,
      required String name,
      required String summary,
      required int numMembers,
      required int numPosts})
      : _id = id,
        _name = name,
        _summary = summary,
        _numMembers = numMembers,
        _numPosts = numPosts;

  String get id => _id;
  String get name => _name;
  String get summary => _summary;
  int get numMembers => _numMembers;
  int get numPosts => _numPosts;

  void join() {
    _numMembers++;
  }

  GroupModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _summary = json['summary'],
        _numMembers = json['numMembers'],
        _numPosts = json['numPosts'];
}
