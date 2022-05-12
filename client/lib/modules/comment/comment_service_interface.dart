abstract class ICommentService {
  String get profilePic;
  String get name;
  String get content;
  int get likeCount;

  Future<void> like();
  Future<void> delete();
}
