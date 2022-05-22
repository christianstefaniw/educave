import '../../data/providers/api_provider_interface.dart';
import 'comment_repository_interface.dart';

class CommentRepository implements ICommentRepository {
  final IApiProvider _client;
  final String _id;

  CommentRepository(this._id, this._client);

  @override
  Future<void> like() async {}

  @override
  Future<void> unlike() async {}
}
