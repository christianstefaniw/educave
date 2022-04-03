import '../../data/providers/api_provider_interface.dart';
import 'post_repository_interface.dart';

class PostRepository implements IPostRepository {
  final IApiProvider _client;
  final String _id;

  PostRepository({required IApiProvider client, required String id})
      : _client = client,
        _id = id;

  @override
  Future<void> like() async {
    await _client.get('');
  }

  @override
  Future<void> unlike() async {
    await _client.get('');
  }
}
