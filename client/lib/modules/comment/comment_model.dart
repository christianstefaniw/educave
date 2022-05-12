class CommentModel {
  final String _id;
  final String _userId;
  final String _name;
  final String _profilePic;
  final String _content;

  int _likeCount;

  CommentModel(
      {required String id,
      required String userId,
      required String name,
      required String profilePic,
      required String content,
      required int likeCount})
      : _id = id,
        _userId = userId,
        _name = name,
        _profilePic = profilePic,
        _content = content,
        _likeCount = likeCount;

  String get name => _name;
  String get profilePic => _profilePic;
  String get content => _content;
  int get likeCount => _likeCount;

  void like() {
    _likeCount++;
  }
}
