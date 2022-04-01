import '../../data/providers/api_provider_interface.dart';
import 'post_repository_interface.dart';

class PostRepository implements IPostRepository {
  final IApiProvider _client;
  PostRepository({required IApiProvider client}) : _client = client;

  @override
  Future<void> like(String id) async {
    await _client.get('');
  }
}
