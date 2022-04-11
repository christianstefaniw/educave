import '../../data/providers/api_provider_interface.dart';
import 'post_repository_interface.dart';

class PostRepository implements IPostRepository {
  final IApiProvider _client;
  final String _postId;

  PostRepository(this._client, {required String postId}) : _postId = postId;

  @override
  Future<void> like() async {
    // await _client.get('');
  }

  @override
  Future<void> unlike() async {
    // await _client.get('');
  }

  @override
  Future<void> save() async {
    // await _client.get('');
  }

  @override
  Future<void> unsave() async {
    // await _client.get('');
  }
}
