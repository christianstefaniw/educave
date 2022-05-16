class CommentModel {
  final String _id;
  final String _userId;
  final String _username;
  final String _profilePic;
  final String _content;
  final String _timeSincePost;

  int _likeCount;
  bool _liked;

  CommentModel(
      {required String id,
      required String userId,
      required String username,
      required String profilePic,
      required String content,
      required int likeCount,
      required bool liked,
      required String timeSincePost})
      : _id = id,
        _userId = userId,
        _username = username,
        _profilePic = profilePic,
        _content = content,
        _likeCount = likeCount,
        _liked = liked,
        _timeSincePost = timeSincePost;

  String get id => _id;
  String get username => _username;
  String get profilePic => _profilePic;
  String get content => _content;
  int get likeCount => _likeCount;
  bool get liked => _liked;
  String get timeSincePost => _timeSincePost;

  void like() {
    _likeCount++;
    _liked = true;
  }

  void unlike() {
    _likeCount--;
    _liked = false;
  }
}
