abstract class ICommentService {
  String get profilePic;
  String get username;
  String get content;
  int get likeCount;
  bool get liked;
  String get timeSincePost;

  Future<void> like();
  Future<void> unlike();
  Future<void> delete();
}
