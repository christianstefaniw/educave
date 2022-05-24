import '../../data/providers/api_provider_interface.dart';
import '../comment/comment_model.dart';
import 'add_comment_repository_interface.dart';

class AddCommentRepository implements IAddCommentRepository {
  final IApiProvider _client;

  AddCommentRepository(this._client);

  @override
  Future<void> addComment(CommentModel comment) async {}
}
