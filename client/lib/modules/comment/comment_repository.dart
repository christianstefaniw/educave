import 'comment_repository_interface.dart';

class CommentRepository implements ICommentRepository {
  final String _id;

  CommentRepository(this._id);

  @override
  Future<void> delete() async {
    throw UnimplementedError();
  }

  @override
  Future<void> like() async {
    throw UnimplementedError();
  }
}
