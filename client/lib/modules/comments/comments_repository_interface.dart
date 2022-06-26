import '../comment/comment_model.dart';

abstract class ICommentsRepository {
  Future<List<CommentModel>> comments();
  void addComment(CommentModel comment);
}
