import '../comment/comment_model.dart';

abstract class IAddCommentRepository {
  Future<void> addComment(CommentModel comment);
}
