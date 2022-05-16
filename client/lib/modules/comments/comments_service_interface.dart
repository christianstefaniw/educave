import '../comment/comment_model.dart';

abstract class ICommentsService {
  Future<void> loadComments();

  List<CommentModel>? get comments;
}
